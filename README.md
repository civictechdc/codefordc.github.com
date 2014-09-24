Code For DC Website
=============

This is the repository for the website for Code for DC, the DC chapter of the Code for America Brigade program.

This site is built on Github pages and uses Jekyll for its blog.

To make changes:
+ We strongly recommend that you set up a local copy of the site and test your changes there before pushing them back to the repository!
+ Work against the Master branch.  Master == Staging.
+ The production website is hosted off of the 'gh-pages' branch.  You shouldn't work against this, but when you have publication-ready changes in Master, you can pull those across to gh-pages to make them live.  The reason for maintaining separate master and gh-pages branches is that it enables people to work against a shared master branch and merge back to it without needing to make the code ready for production first.


Special pages:
+ Press page uses /data/press.csv to populate its press listing (but not the press releases, which are hard-coded)
+ Blog pages are built programmatically using Jekyll from the entries in the /blog/_posts directory.  There is similar content in the /blog/drafts directory, but these entries are working copies only that are not displayed on teh public website.
+ Projects page is built programatically using a special json file that is built nightly.  See below

Adding your project to the projects page:
+ Each project on the projects page must include a civic.json file in the base directory of its master branch.
+ Find a template file here: https://github.com/codefordc/files/blob/master/civic.json.template
+ Find the specification for the civic.json file here: https://github.com/codefordc/files/blob/master/specification.md
+ Once you add your civic.json file (or if you're having trouble doing so) please use the form on the projects page to let us know that we should add it to the index!
+ Once the project is indexed, it will stay up to date with commits and any changes you make to your civic.json file.

