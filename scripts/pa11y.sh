if [[ -z "$TRAVIS" ]];
then
    TRAVIS_PULL_REQUEST=false
    TRAVIS_BRANCH="localtest"
    TRAVIS_COMMIT="abcd1234"
    TRAVIS_REPO_SLUG="local/test"
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
bundle exec jekyll serve --detach

# grab sitemap and store URLs
wget -q http://localhost:4000/sitemap.xml --no-cache -O - | egrep -o "http://codefordc.org[^<]+" | xargs -I '{}' echo {} > sites

# iterate through URLs and run runtest on each
cat sites | while read a; do runtest $a; done

# close down the server
pkill -f jekyll

# clean up
rm results.json pa11y.json sites

