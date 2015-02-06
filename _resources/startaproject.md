---
title: Starting a Project
layout: resource
type: guide
edit_link: https://editfordc.herokuapp.com/document/8f55848d-8175-4f90-9200-d3a6c010a7c6
---

# How to Start a Project

So you have a project--or an idea for a project--to make life better for the people of DC and you want to bring it to Code for DC? Awesome! We're glad you thought of us. In order to help us help you, here's what you should do:

## Make a Github repo

You may already have one, but make sure that you have a Github repo for the project. This is true even if the project is still just an idea: a repo saves the space, offers some discussion tools, and makes it possible for other people to begin working on the project. The only document that's really required is a `README` file explaining (1) what the project is and (2) how to run the project locally, if applicable.

To take the administrative burden off of you, Code for DC can set up a repo for the project in our Github organization. If you want us to do that, just let us know. If you already have a repo, this is still possible: it can be [transferred](https://help.github.com/articles/transferring-a-repository/) into the Code for DC organization without losing any of the commit history or issue.

## Choose a license

This is an important step for the type of open work we do at Code for DC. Without a license, each contribution is copyrighted by the individual author, which can make something of a mess. We recommend using a [CC0 license](https://creativecommons.org/publicdomain/zero/1.0/legalcode) for maximum openness, but there are other popular open-source licenses. You can find one that works for you [here](http://choosealicense.com/).

Once you've selected a license, you should include the text of that license in a `LICENSE.md` file in the root of your repo. Additionally, you should include language, either in the `README` or a separate `CONTRIBUTING.md` file stating that contributors to the repo agree to license their work under the same license. It's also a good practice to mention the license you've chosen in the `README`, as well.

If anybody besides you contributed to the project before a license was applied, or if you change the license, make sure to get their approval. This can be done in whatever way works: in person, via email, or even a [Github issue](https://github.com/project-open-data/project-open-data.github.io/pull/135).

## Put a `civic.json` file in that repo

A `civic.json` file is the metadata file of the type of civic-oriented project we work on here at Code for DC. We've made a template to start you off, and it's available right [here](/resources/examples/civic.json.template). For instructions on how to fill it out, check out the specifications [here](/resources/specification.html).

## Let everybody know

Head over to codefordc.org/projects and submit the project's repo URL to us. We'll pull information from Github and that `civic.json` file and make it look nice. Feel free to send a message out to the [listserv](https://groups.google.com/forum/#!forum/dc-cfa-brigade), as well, explaining what the project is and what sort of help you think is needed.

## Bonus: Make contributing easy

### Use Common and Accessible Tools

When choosing the tools that will be used to build the project, consider the startup time that a new recruit will need to learn how to use those tools. Since Code for DC projects are mostly volunteer projects and are open to non-experts, using tools that are common across projects or that are simpler to learn may significantly reduce startup time and increase the number of pull requests you receive. There is a trade-off between cutting-edge and community engagement, so keep that in mind.

For example, the Code for DC website is built in Jekyll to take advantage of Github Pages. Jekyll has built-in support for Sass, so we have a choice between that and CSS when writing our stylesheets. Sass is pretty useful, but using it would require anybody who wants to work on our CSS to learn an entire new language. As a result, we're sticking with CSS for now to keep things accessible.

### Simple Installation

To allow potential contributors to get up and running on the project quickly, we recommend using tools like the [Chrome Dev Editor](https://chrome.google.com/webstore/detail/chrome-dev-editor-develop/pnoffddplpippgcfjdhbmhkofpnaalpg?hl=en), [Docker](https://www.youtube.com/watch?v=VeiUjkiqo9E), or [Vagrant](https://docs.vagrantup.com/v2/why-vagrant/) to simplify local installation. Less time installing the project means more time getting work done!
