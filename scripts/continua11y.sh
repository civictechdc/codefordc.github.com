#! /usr/bin/env bash

if [[ -z "$TRAVIS" ]];
then
    # local development options
    TRAVIS_PULL_REQUEST=false
    TRAVIS_BRANCH="test"
    TRAVIS_COMMIT="$(echo $RANDOM | md5)"
    # TRAVIS_REPO_SLUG must be a valid github repo
    TRAVIS_REPO_SLUG="stvnrlly/continua11y"
    # change to whichever script you need to start the web server (make sure to detach so that the script continues)
    RUN_SCRIPT="bundle exec jekyll serve --detach"
    # shut down the web server so that you can run the script again without conflicts
    KILL_SCRIPT="pkill -f jekyll"
    # the port where the server will run
    PORT=4000
    # if your site generates a sitemap, set this to true to use it instead of spidering
    USE_SITEMAP=false
    # the location for the locally-running version of continua11y
    # for local development, set the protocol for cURL to http, as well
    CONTINUA11Y="localhost:3000"
else
    # we're on travis, so install the tools needed
    npm install -g pa11y
    npm install -g pa11y-reporter-1.0-json
    npm install -g html-inline
    # jq is already be installed on travis, but it needs to v1.5 to have --slurpfile
    wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 -O /tmp/jq
    chmod +x /tmp/jq
    export PATH=/tmp:$PATH
fi

red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
reset=`tput sgr0`

# set the default standard, if necessary
if [[ -z "$STANDARD" ]];
then
    STANDARD="WCAG2AAA"
fi

# get the most recent git commit message
TRAVIS_COMMIT_MSG="$(git log --format=%B --no-merges -n 1)"
TRAVIS_COMMIT_MSG="$(echo $TRAVIS_COMMIT_MSG | sed s/\"/\'/g)"

# set up the JSON file for full results to send
echo '{"repository":"'$TRAVIS_REPO_SLUG'", "branch": "'$TRAVIS_BRANCH'","commit":"'$TRAVIS_COMMIT'","commit_message":"'$TRAVIS_COMMIT_MSG'","pull_request":"'$TRAVIS_PULL_REQUEST'","commit_range":"'TRAVIS_COMMIT_RANGE'","standard":"'$STANDARD'","data":{}}' | jq '.' > results.json

# start the server, if necessary
RUNNING="$(curl -s -o /dev/null -w "%{http_code}" http://localhost:${PORT})"
if [[ $RUNNING == "000" ]]
then
    echo "${green} >>> ${reset} starting the server"
    eval $RUN_SCRIPT
    sleep 5 # sometimes things take time
else
    echo "${green} >>> ${reset} the server's already running"
fi

# make local copy of the site
mkdir temp
cd temp
if ! $USE_SITEMAP;
then
    echo "${green} >>> ${reset} using wget to mirror site"
    wget --quiet --mirror --convert-links http://localhost:${PORT}
else
    echo "${green} >>> ${reset} using sitemap to mirror relevant portion of site"
    wget --quiet http://localhost:${PORT}/sitemap.xml --no-cache -O - | egrep -o "http://localhost:${PORT}" > sites.txt
    cat sites.txt | while read a; do wget --convert-links --page-requisites $a; done
    rm sites.txt
fi
echo "${green} <<< ${reset} found $(find . -type f | wc -l | sed 's/^ *//;s/ *$//') files in $(find . -mindepth 1 -type d | wc -l | sed 's/^ *//;s/ *$//') directories"

function relpath() { 
    python -c 'import sys, os.path; print os.path.relpath(sys.argv[1], sys.argv[2])' "$1" "${2:-$PWD}"; 
}

# iterate through URLs and run runtest on each
function runtest () {
    URL="$(relpath $file .)"
    if [[ $(file -b --mime-type $file) == "text/html" ]]
    then
        echo "${blue} |--------------------------------------- ${reset}"
        echo "${blue} |-> ${reset} analyzing ${URL}"
        pa11y -r 1.0-json -s $STANDARD $URL > pa11y.json
        
        # single apostrophes mess up the json command below, so remove them
        # sed -n "s/'//g" pa11y.json

        # compress external resources into the html and convert to json
        html-inline -i $file -o site.html
        # himalaya site.html site.json
        openssl enc -aes128 -a -A -in site.html -out site.txt -k continua11y
        echo "{\"html\":\"$(cat site.txt)\"}" > site.txt

        # add this report into results.json
        jq -n --slurpfile a pa11y.json --slurpfile b site.txt --slurpfile c ../results.json '$c | .[] * {data: {"'"${URL}"'": ({pa11y: $a | .[]} + {html: $b | .[].html})}}' > ../temp.json
        cp ../temp.json ../results.json
        ERROR="$(cat pa11y.json | jq .count.error)"
        WARNING="$(cat pa11y.json | jq .count.warning)"
        NOTICE="$(cat pa11y.json | jq .count.notice)"
        echo "${green} <<< ${reset} pa11y says: ${red}error:${reset} ${ERROR} | ${yellow}warning:${reset} ${WARNING} | ${green}notice:${reset} ${NOTICE}"
        rm pa11y.json site.html site.txt
    else
        echo "${blue} ||  ${reset} ${URL} is not an html document, skipping"
    fi
}

echo "${green} >>> ${reset} beginning the analysis"
echo "${blue} |--------------------------------------- ${reset}"
for file in $(find .);
do
    runtest $file
done
cd ..

# shut down the server, if necessary
if [[ $RUNNING == "000" ]];
then
    echo "${green} >>> ${reset} closing the server"
    eval $KILL_SCRIPT
fi

# send the results on to continua11y
echo "${green} >>> ${reset} sending results to continua11y"
if [[ -z "$TRAVIS" ]]
then
    curl -s -X POST http://${CONTINUA11Y}/incoming -H "Content-Type: application/json" -d @results.json -o curl.txt
else
    curl -s -X POST https://continua11y.herokuapp.com/incoming -H "Content-Type: application/json" -d @results.json -o curl.txt
fi

# clean up
echo "${green} >>> ${reset} cleaning up"
rm -rf temp temp.json curl.txt results.json 