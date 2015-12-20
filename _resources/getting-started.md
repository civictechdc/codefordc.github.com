---
title: Getting Started with Civic Hacking
layout: resource
type: guide
---

# Hello, Civic Hacking World!

If you're looking to give civic hacking a try, but don't know where to start, we have some suggestions for you. First, check out our [list of projects](/project.html) to see what's active, or what could use your help. If you have questions, join our [Slack](/joinslack.html) and ask.

## Learn About GitHub

Much of our work takes place on [GitHub](https://github.com). If you're not familiar with it, you may want to take some time to get up to speed. 18F has created a [useful guide](https://18f.gsa.gov/2015/03/03/how-to-use-github-and-the-terminal-a-guide/) to GitHub and using the OSX Terminal. The guide is focused on contributing to the 18F website, but the [Code for DC website](https://github.com/codefordc/codefordc.github.com) is structured the same way. See if you can submit a pull request to the Code for DC website. If you can't find anything to add or change, there's a file called `graffiti.md` to add whatever you want, like "Hello, World!".

For a higher-level overview of `git`, check out this [15-minute introduction](https://try.github.io/). Once you get started, this [cheat sheet](https://training.github.com/kit/downloads/github-git-cheat-sheet.pdf) might come in handy to remember key commands.

## Open Some Data

### Get Data Released

Check out [DC's data repository](http://opendata.dc.gov/) or our own [community data portal](http://opendatadc.org/) to see what's available. Ideally, DC should provide all of the data [identified as "high-value"](https://census.usopendata.org/methodology.html). If you find something that's missing, or out-of-date, contact the appropriate agency to politely let them know that they should release it. This might take some time and persistence, but you might also find that an agency is friendlier and more responsive than you could have imagined. 

If you're unable to get the agency to release the data, it may be time to submit a FOIA request. DC provides a [FOIA portal](http://foia-dc.gov/palMain.aspx) for doing exactly that. However, you can also use [MuckRock](https://www.muckrock.com/place/united-states-of-america/district-of-columbia/washington/) to handle all of the heavy lifting for you.

### Improve Existing Data

Sometimes, an agency releases data in a form that isn't archived and/or isn't machine-readable. You can improve the world by correcting that. For example, Aaron created [a web scraper to save the mayor's schedule](https://github.com/ajschumacher/dc_mayor_schedule), which was posted daily but not archived, and then made a small site to display that historical data. Or, Liz created [a script to pull prison population data out of PDFs](https://github.com/lizmeister321/rebuilding-reentry) posted monthly. Here is [a list of common problems](https://github.com/Quartz/bad-data-guide) to look for.

For web scraping, some popular tools include [Beautiful Soup](http://www.crummy.com/software/BeautifulSoup/) for Python or [Nokigiri](http://www.nokogiri.org/) for Node. For PDF extraction, [Tabula](http://tabula.technology/) can be a good place to start.

## Visualize Some Data, or Make It Actionable

If you've found a dataset, but aren't sure what to do with it, it can be fun to play around for it and find the stories within the data. Consider how to make that data more interesting and informative to the general public. For example, Chris [visualized the distribution of funding](http://cmgiven.github.io/at-risk/) for "at-risk" students in DC ([code here](https://github.com/cmgiven/at-risk)). Chris also created [a site to check your odds](https://cmgiven.github.io/bikeshare-odds/) of finding a bike at a Bikeshare dock ([code here](https://github.com/cmgiven/bikeshare-odds)).

If you're interested in visualizations, [D3](http://d3js.org/) is a popular way to make a beautiful one using Javascript.

## Make a Website Easier to Use

Sometimes, an agency provides an awesome service that's difficult to access. In some cases, you can help that by creating an easier-to-use interface. For example, Emanuel created [a really simple tool](http://getdctrees.org/) to request that DC plant a tree at a certain address ([code here](https://github.com/emanuelfeld/tree-map)).

## Map Something

## Create a Twitter Bot

Building a Twitter bot is easier than you think, and it can be a great way to improve the visibility of some data while learning a bit of code. For example, Emanuel created [a bot](https://twitter.com/booksfordc) that tweets out new additions to the DC Library's catalog ([code here](https://github.com/emanuelfeld/booksfordc)).

You can find frameworks for [Python](https://github.com/magsol/pybot), [Ruby](https://github.com/muffinista/chatterbot), and [Node](https://github.com/dariusk/examplebot) to make this easier for you.