---
layout: post
title:  "Dealing with the Maryland Coordinate System"
post_author: "Drew Bollinger"
post_twitter: "@drewbo19"
post_avatar: "drew-bollinger.png"
date:   2014-10-20 00:00:01
categories: blog
---


If you're reading this, you've likely come across some geo data that you want to use but the coordinates are given in the [Maryland Coordinate System](http://www.mgs.md.gov/geology/maryland_coordinate_system.html) and you'd like to have them in a more usable format, like simple latitude/longitude. Well, you're in luck. For our project [mapping gun crimes in DC](https://github.com/cmgiven/dc-handguns), we needed to make this same conversion and tried to come up with a more repeatable way to do it in the future. The crime data that DC provides only gives `BLOCKCOORDS` and we needed lat/lng in order to map it.

### Maryland Coordinate System

First, some background. Plenty of geo government data is provided in the Maryland Coordinate System, which shows east/west and north/south distance in meters from a fixed point. While using lat/lng seems obvious to those of us raised on web mapping, there's a fairly good reason for using a state-specific coordinate system: it makes surveying and intra-state work much simpler. Also, the errors produced by pretending the earth is flat tend to be [very small](http://en.wikipedia.org/wiki/State_Plane_Coordinate_System) at the state level.
But now that we can easily project information on to a map using spherical coordinates, it makes sense to seek an easy way to convert.

### DC GIS Developer Tools

The DC government has very functional web tool [for converting from Maryland Coordinate System to lat/long](http://citizenatlas.dc.gov/usng/getusng.asmx) on the [DC GIS Developer Page](http://octo.dc.gov/node/718362).

![](https://www.evernote.com/shard/s35/sh/07ed9cef-e9bc-45f9-8f7d-06ac45374975/6c95560207e75f5f6f6361fe728bc864/deep/0/Screen-Shot-2014-10-09-at-12.13.58-PM.png-(PNG-Image,-895---396-pixels).png)

However the service isn't very easy to find, could be easier to use, and doesn't natively handle large batch requests. I recently needed to convert more than 2,000 coordinate sets, so I wrote a small script. I'm not familiar with SOAP requests, so I used a python script to execute multiple HTTP POST requests.

### Python

You'll need two different python modules for this:

    import requests
    from bs4 import BeautifulSoup

The response will be in XML (not ideal), so we will use [Beautiful Soup](http://www.crummy.com/software/BeautifulSoup/) to convert to a more useable format. Normally I'd use [lxml](http://lxml.de/) for this because it is fast. However lxml is less accepting of badly formatted XML. As our responses will be small and maybe a little messy, Beautiful Soup is a safer choice.

We use `requests` to set up the requests. Here's an annotated mock script:

    data = []
    url = "http://citizenatlas.dc.gov/usng/getusng.asmx/MD_SPCStoLL"

    for d in raw_data:
    try:
        value = d[7] + ',' + d[8]            # these are the block coordinates from the raw data
        params = {'SPCSXYSTR': value}        # we need to send a key-value pair with this key name and our coordinates as the value
        r = requests.post(url,data=params)   # make a post request with our data
        soup = BeautifulSoup(r.text)         # construct a BeautifulSoup object out of the XML response
        cs = soup.find('convstr')            # the lat/lng coordinates are given inside this tag
        row = []
        row.append(cs.text.split(',')[0])    # append the lat to our output row
        row.append(cs.text.split(',')[1])    # append the lng to our output row
        print(cs.text)
        data.append(row)                     # append this row to our final data
    except:
        print("ERROR")

So about ~20 lines of python to get our final result!

The full code for our project is located [here](https://github.com/cmgiven/dc-handguns/blob/master/data/blockcoord_convert.py)

Thanks to [Chris Given](https://github.com/cmgiven), [Tobias Shapinsky](https://github.com/TShapinsky), [Steven Reilly](https://github.com/stvnrlly) and [Tim Abdella](https://twitter.com/tabdella) for their help with this project and post.
