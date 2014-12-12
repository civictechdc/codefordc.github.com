# Code For DC Website

This is the repository for the website for Code for DC, the DC chapter of the Code for America Brigade program.

This site is built on Github pages and uses Jekyll for its blog.

## Contributing

If you want to make a blog post: read [this](https://github.com/codefordc/guides/blob/master/codefordc-blog/make-a-blog-post.md).

If you want to add a project to the projects page: read [this](https://github.com/codefordc/guides/blob/master/start-a-project.md).

For everything else:

Make sure that you have [`git`](http://git-scm.com/downloads) and [`jekyll`](http://jekyllrb.com/docs/installation/) on your computer.

Create your own fork, then clone the repo to your computer and grab the submodules:

    git clone git@github.com:[YOUR GITHUB NAME]/codefordc-2.0.git
    git submodule init
    git submodules update

Work on the `master` branch (which is the default), or feel free to set up a new branch if you're working on a specific feature:

    git checkout -b [NEW BRANCH NAME]

When you're done, test your changes:

    jekyll serve -w

Point your browser to 0.0.0.0:4000 and check that things work as expected. If so, open a pull request from your forked repo to the original Code for DC repo.
