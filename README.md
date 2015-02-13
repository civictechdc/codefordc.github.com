# Code For DC Website

This is the repository for the website for Code for DC, the DC chapter of the Code for America Brigade program.

This site is built on Github pages and uses Jekyll for its blog.

## Contributing

If you want to make a blog post: read [this](https://github.com/codefordc/guides/blob/master/codefordc-blog/make-a-blog-post.md).

If you want to add a project to the projects page: read [this](https://github.com/codefordc/guides/blob/master/start-a-project.md).

For everything else:

First, make sure that you have [`git`](http://git-scm.com/downloads) on your computer. Create your own [fork](https://guides.github.com/activities/forking/) of the repository, then clone it to your computer:

    git clone git@github.com:[YOUR GITHUB NAME]/codefordc-2.0.git

You can work on the `master` branch (which is the default), but it's preferable to set up a new branch if you're working on a specific feature:

    git checkout -b [NEW BRANCH NAME]

Next, you'll want to view the site locally using [`jekyll`](http://jekyllrb.com/docs/installation/). There are two ways to do this:

### Less steps, but more points of failure

Make sure that you have [Ruby](https://www.ruby-lang.org/en/downloads/) installed on your system.

If you do, try this:

    gem install jekyll #sudo is probably required
    jekyll serve -w

Hopefully it works! If not and you see something like `jekyll: command not found`, you'll need to add the jekyll executable's location to your shell's `$PATH` variable. Here's an example of how that might work, but you should do some Googling to understand what you're doing here:

    gem which jekyll
    # /usr/lib/ruby/gems/1.9.3/gems/jekyll-2.4.0/lib/jekyll.rb
    export PATH=$PATH:/usr/lib/ruby/gems/1.9.3/gems/jekyll-2.4.0/bin
    jekyll serve -w

Point your browser to 0.0.0.0:4000. As you can see, this is a bit of a hacky workaround. If you upgrade Ruby in the future, be aware that this might get confusing as you add more gems.

### More steps, but more likely to work

A more elegant solution is to use a Ruby manager. Both `rbenv` and `RVM` are popular, but this example will use the former for its simplicity. Install [it](https://github.com/sstephenson/rbenv#installation), making sure to set up the init script and restart your shell. This may take some effort, but will allow you to manage multiple versions of Ruby and their various dependencies across projects (this is a common problem in Rubyland).

Then:

    rbenv install 2.1.1
    gem install bundler
    bundle install
    bundle exec jekyll serve -w

Point your browser to 0.0.0.0:4000.
