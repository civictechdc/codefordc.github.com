---
layout: post
categories: blog
title:  "DC voter registration data is public, but not very easy to get"
date:   2015-2-4 09:55:00
post_author: "Aaron Schumacher"
post_avatar: "aaron-schumacher.jpg"
post_twitter: "@planarrowspace"
---

On Thursday, December 18, 2014, I took a printed copy of a [PDF form](http://www.dcboee.org/pdf_files/Data_Request_Form.pdf) that I found on the [DC Board of Elections web site](http://www.dcboee.org/) to 441 4th Street NW, suite 250 north, Washington, DC, 20001, during the [office](https://www.dcboee.org/contactus/index.asp) hours of 8:15-4:45. I had to show ID, have my bag x-rayed, and go through a metal detector to get into the building.

Here's a line that appears in red on the [PDF form](http://www.dcboee.org/pdf_files/Data_Request_Form.pdf):

> **Entire Voter Roll may only be obtained in Microsoft Access CD-ROM format.**

<!--more-->

I brought my checkbook so I could pay $2 for a CD-ROM of voter registration data. The clerk informed me that the data is updated daily. She burned my CD while I waited. She told me there are no rules on how the data can be used. I take it to be public domain, because I haven't seen any other information on copyright or otherwise.

![](/images/blog/images/2014-12-22/cd.jpg)

The data includes detailed information on registered DC voters including name, date registered, location in DC, and party, along with voting records (whether the person voted, not what their votes were) for the last forty or so elections. This could be used for planning voter registration drives or reminding people to vote, for example. It could also be combined with other data sets to get a more comprehensive understanding of DC, and probably lots of other things I haven't thought of.

On the CD were two files:

 * The data was in a Microsoft Access database file called `DC VH EXPORT.MDB` (154 MB). I bought a PC laptop running Windows 8, purchased and installed Microsoft Access, opened the file and exported the data as text. It comes out as 130 megabytes of uncompressed text. I was able to get the column headers out and stick them on top of the file so that it can be read as nice CSV. Zipped (using the Windows built-in) the result is the 20 MB [20141218-dc_voters.csv.zip](https://github.com/ajschumacher/dc_voter_reg/blob/master/20141218-dc_voters.csv.zip).
 * The provided documentation file was a plain text `Read Me.txt`. I renamed this to [20141218-dc_voters.txt](https://github.com/ajschumacher/dc_voter_reg/blob/master/20141218-dc_voters.txt). It seems slightly out of date with respect to the data in that the later columns corresponding to elections are not the same in the documentation and in the data. These column names are interpretable as MMYYYY-T, I believe, where MM is numeric month, YYYY is four-digit year, and T is a letter corresponding to election type. I think G is General and P is primary.

You can also get voter registration data on a per-ward basis in Microsoft Access or Excel formats. They will email it to you, but you have to fax in the form to make this request. I wonder if they would accommodate daily requests for every ward's data. It seems like it would be much less annoying to just put the data online automatically; it isn't even very heavy. If we dream big, maybe the data could live in [dat](http://dat-data.com/)? Any option that doesn't require making a physical visit to their office during their fairly narrow business hours would be an improvement. Any format that doesn't require purchasing proprietary software would be an improvement.

Another thing you can get is images (PDFs?) of signatures for nominating petitions and ballot measures. You pay just $2 per CD-ROM, but these are only available during ten-day "challenge periods." So keep your eyes peeled! I haven't seen what these things look like.

At least you can get nice maps like this (or for individual wards) for just $10 each:

![](/images/blog/images/2014-12-22/map.jpg)

*See [`dc_voter_reg`](https://github.com/ajschumacher/dc_voter_reg) on GitHub for the data and concise documentation. An earlier version of this post also appears on [my blog](http://planspace.org/20141220-dc_voter_registration_data/)*.
