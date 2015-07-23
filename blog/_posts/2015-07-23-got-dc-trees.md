---
layout: post
categories: blog
title:  "Got DC Trees?"
date:   2015-07-23 16:30:55
authors:
- emanuelfeld
---

On April 20th, I launched [getdctrees.org](https://getdctrees.org) with four goals in mind:

1. Highlight the gaps in DC's urban tree canopy and visualize their distribution across the District
2. Let users easily see if there is room to request a new tree in their neighborhood
3. Make this data actionable by linking it to the DC 311 system
4. Increase awareness of the [Urban Forestry Administration's](http://ddot.dc.gov/page/ddot-urban-forestry-administration-ufa) work

I anticipated that there would be a sizable jump in requests, with the majority of people discovering the site through direct links on social networks. It was also my hope that providing a zoomed out view of the data would result in a more equitable distribution of requests among DC's wards.[<sup>1</sup>](#1)

# What ended up happening?

**Traffic and Publicity**

Word first went out on [Twitter](https://twitter.com/CodeforDC/status/590138182454353920) and Reddit's [/r/washingtondc](https://www.reddit.com/r/washingtondc/comments/338b5d/wish_there_were_more_trees_in_your_neighborhood_i/) community. Reporters from the [Washington Post](http://www.washingtonpost.com/news/local/wp/2015/04/20/d-c-has-13000-open-spots-for-trees-heres-how-you-can-fill-them/) and [DCist](http://dcist.com/2015/04/want_more_trees_on_your_block_getdc.php) then quickly got in touch, with most visitors arriving through their write-ups. Radio and website [coverage by WAMU](http://wamu.org/news/15/04/24/in_dc_you_can_now_plant_a_tree_with_little_more_than_a_click) later in the week provided another traffic boost.

From April 20th to June 15th,[<sup>2</sup>](#2) the site received **3,800** visits, with about **2,300** coming from within DC itself. 

**Tree Requests**

Over that same period, UFA received **1,073** tree planting requests.[<sup>3</sup>](#3) Now, admittedly some of these requests would have come in anyhow, but the getdctrees.org effect is *pretty* darn clear. Last year, the same period saw a mere 382 requests.

![](https://raw.githubusercontent.com/emanuelfeld/emanuelfeld.github.io/master/assets/requests_2015.png)

Where did all these requests come from?

You might be aware that there's quite a bit of variation in tree coverage across DC's 8 wards. In wards 1 and 2, only about 2% of tree plots are empty, versus wards 5, 7, and 8, with vacancy percentages in the mid to high teens.

After getdctrees.org's launch, ward 5, which had the greatest number of available plots—**3,728**—also received the most planting requests—**242**. Wards 7 and 8 continued to lag behind, submitting **86** and **27** requests, respectively. Notably, however, they submitted only 25 and 4 requests over the same period last year!

Ward 1, despite having just **162** open plots on April 20th, submitted **128** planting requests.

![](https://raw.githubusercontent.com/emanuelfeld/emanuelfeld.github.io/master/assets/requests_ward_2015.png)

Of course, the Urban Forestry Administration is itself actively working to even out the distribution of trees in the city, with 8,000 or so planted in the past year, the bulk of which have reportedly gone to areas east of the Anacostia. 

Still, there is room to build more public engagement in the process. When an individual requests a tree, a sense of ownership and accountability is created. They are going to be more likely to keep an eye on or even help water the tree through the [Canopy Keeper](http://ddot.dc.gov/node/508872) program, leading to improved outcomes.[<sup>4</sup>](#4)

The map below shows the locations of each of the 1,073 planting requests.

<iframe width='100%' height='400' frameborder='0' src='https://evonfriedland.cartodb.com/viz/aedfa200-2e78-11e5-858a-0e4fddd5de28/embed_map' allowfullscreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>

# Some thoughts and lessons learned

* No one reads 'about' pages! Ok, well not no one. But of the 4,759 page visits received, only 532 were to the ['about' page](https://getdctrees.org/about.html). I'll be optimistic and guess that most visitors read the articles. It still might have been wise to migrate all that information to the main page.

* There is room to better tie in Canopy Keeper enrollment with 311 planting requests. Currently, the sign up process targets trees that have already been planted, which limits buy-in. Capitalize on the joy that requesting a tree creates.

* Outreach is a challenge when the target audience is broad and sending out emails is not highly effective. There is a clear need to identify interested groups, individuals, and forums that can help in spreading the word.[<sup>5</sup>](#5)

* To prevent initiatives like getdctrees.org—which are largely spread on social media—from being just a flash in the pan, there needs to be adoption by government and/or community institutions, who will issue reminders to the public. I'm certain a large fraction of the site's success came not just from its humane interface, but because many people previously had *no idea* they could request trees from the city.

Finally, a big thank you to Earl Eutsler, Deputy Associate Director at UFA, for his generosity in fielding my questions and for pointing me to the right datasets, and to all of UFA for their impressive work growing and maintaining DC's urban forest.

<br>
---
<br>

<a name="1">1.</a> This is clearly a complex issue and has no simple technological fix. For more discussion, check out [this article](http://www.washingtonpost.com/local/environmentalists-face-challenges-trying-to-plant-in-less-green-neighborhoods/2013/04/25/21294968-ad27-11e2-a198-99893f10d6dd_story.html) published by the Washington Post in 2013.

<a name="2">2.</a> June 15th being the official last day for requests for the upcoming planting season.

<a name="3">3.</a> Request data, as of this posting, available [here](https://github.com/emanuelfeld/tree-map/blob/gh-pages/data/planting_requests_all.csv).

<a name="4">4.</a> See, for example, this [Tweet](https://twitter.com/brianwarmoth/status/590555914626793472).

<a name="5">5.</a> If you're interested, I started a channel on the Code for DC Slack dedicated to these outreach efforts and discussions.
