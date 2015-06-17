if [[ -z "$TRAVIS" ]];
then
    # local development options
    TRAVIS_PULL_REQUEST=false
    TRAVIS_BRANCH="test"
    TRAVIS_COMMIT="testing123"
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
    CONTINUA11Y="localhost:3000"
else
    npm install -g pa11y
    npm install -g a11y-reporter-1.0-json
    npm install -g json
fi

# set up the JSON file for full results to send
echo '{"repository":"'$TRAVIS_REPO_SLUG'", "branch": "'$TRAVIS_BRANCH'","commit":"'$TRAVIS_COMMIT'","data":{}}' | json > results.json

function runtest () {
    pa11y -r 1.0-json $a > pa11y.json
    
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
if ! $USE_SITEMAP;
then
    echo "using wget spider to get URLs"
    wget -m http://localhost:${PORT} 2>&1 | grep '^--' | awk '{ print $3 }' | grep -v '\.\(css\|js\|png\|gif\|jpg\|JPG\)$' > sites.txt
else
    echo "using sitemap to get URLs"
    wget -q http://localhost:${PORT}/sitemap.xml --no-cache -O - | egrep -o "http://codefordc.org[^<]+" > sites.txt
fi

# iterate through URLs and run runtest on each
cat sites.txt | while read a; do runtest $a; done

# close down the server
eval $KILL_SCRIPT

# send the results on to continua11y
curl -X POST http://${CONTINUA11Y}/incoming -H "Content-Type: application/json" -d @results.json
cat results.json

# clean up
rm results.json pa11y.json sites.txt