if [[ -z "$TRAVIS" ]];
then
    TRAVIS_PULL_REQUEST=false
    TRAVIS_BRANCH="localtest"
    TRAVIS_COMMIT="abcd1234"
    TRAVIS_REPO_SLUG="codefordc/codefordc-2.0"
    RUN_SCRIPT="bundle exec jekyll serve --detach"
    KILL_SCRIPT="pkill -f jekyll"
    USE_SITEMAP=false
    PORT=4000
    CONTINUA11Y="localhost:3000"
else
    npm install -g pa11y
    npm install -g json
fi

# TODO: do something with branch name

# set up the JSON file for full results to send
echo '{"repository":"'$TRAVIS_REPO_SLUG'","commit":"'$TRAVIS_COMMIT'","data":{}}' | json > results.json

function runtest () {
    pa11y -r json $a > pa11y.json
    
    # single apostrophes ruin JSON parsing, so remove them
    sed "s/'//g" pa11y.json
    
    # store JSON as a variable
    REPORT="$(cat pa11y.json)"

    # add this pa11y report into results.json
    json -I -f results.json -e 'this.data["'$a'"]='"${REPORT}"''
}

# start Jekyll server
eval $RUN_SCRIPT

# grab sitemap and store URLs
if [[ -z "$USE_SITEMAP"]];
then
    wget -m http://localhost:${PORT} 2>&1 | grep '^--' | awk '{ print $3 }' | grep -v '\.\(css\|js\|png\|gif\|jpg\|JPG\)$' > sites.txt
else
    wget -q http://localhost:${PORT}/sitemap.xml --no-cache -O - | egrep -o "http://codefordc.org[^<]+" > sites.txt
fi

# iterate through URLs and run runtest on each
cat sites.txt | while read a; do runtest $a; done

# close down the server
eval $KILL_SCRIPT

# send the results on to continua11y
curl -X POST https://${CONTINUA11Y}/incoming -H "Content-Type: application/json" -d @results.json
cat results.json

# clean up
rm results.json pa11y.json sites.txt

