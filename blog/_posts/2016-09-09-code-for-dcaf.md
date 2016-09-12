---
layout: post
title: "How we shipped a community-built project for reproductive justice"
authors:
- mebates
- colinxfleming
date: 2016-09-12 09:32:01
categories: blog
description: "Here's how we built an open-source civic project in nine months with the DC Abortion Fund."
---

We’re proud to announce the launch of the DC Abortion Fund’s Case Manager App (CM App). On August 22, the first volunteer case manager called fifteen patients in need of financial help for their abortions, assisted by a secure, accessible, easy-to-use application instead of a shared spreadsheet. A volunteer team of designers and developers, along with our DCAF partners, shipped the CM App in less than nine months. Here’s how a little structure, a few principles from agile, and a lot of contributors made it happen.

<!--more-->

## What is the DC Abortion Fund?

The mission of the [DC Abortion Fund](http://www.dcabortionfund.org) (DCAF) is to ensure that a patient’s capacity to choose abortion is not dependent on having the cash on hand. The all-volunteer organization seeks to make choice a reality by supporting individuals of any age who lack resources to access abortion care in DC, Maryland, and Virginia. This work is necessary because of the myriad state and national laws designed to deny access to abortion care, including the [Hyde Amendment](https://en.wikipedia.org/wiki/Hyde_Amendment) which bars the use of certain federal funds (including Medicaid) from paying for abortions. National and local abortion funds work to close the gap between the cost of the procedure and what the patient can afford by providing small grants to the patient.

DCAF’s volunteers have carefully perfected operational procedures, management, fundraising, and customer service over the past decade, but unsurprisingly their technology has not kept up. For several years, the 70-person volunteer case management team has used a shared spreadsheet, uploaded through a secure cloud storage system, to manage patient information and status. Common problems of shared spreadsheets plagued case managers: software dependency, simultaneous users overwriting each other, inconsistent data entry and formatting, and no call tracking.

## We started with a lot of planning

Last summer, Max Richman from DataKind DC and Kate Vlach from DCAF connected to discuss opportunities for analysis within DCAF’s data. A core group of volunteers from DCAF, [DataKind DC](http://www.datakind.org/chapters/datakind-dc), and [Code for DC](http://codefordc.org/) started thinking through a new technology solution for the Fund. For a few months, a team of interested civic designers and developers learned DCAF’s processes and needs by working with case managers and other volunteers. We explored the ways in which a technology solution could alleviate pain points in the existing case management process. We eventually agreed to develop an open-source Ruby on Rails app, built around a carefully-designed, simple user experience.

We attended Code for DC hacknights every two weeks, attempting to recruit volunteer designers and developers to loosely push the project along. Our dedicated case manager volunteers, Lisa Waldschmitt and Jenn Rudiger, attended every session too, providing business insights and shedding light on case manager practices. After a few weeks, we had a few interested volunteers and a clear idea of where we wanted to end up, but not much to show for our efforts in code.

## And then we got agile

In December, a small group met for a release planning session inspired by the Agile and Lean methodologies. We defined a minimum-viable product for release through epics and created a backlog of stories under each epic. We started treating the two-week gap between hacknights as sprints, and used GitHub issues and [milestones](https://github.com/colinxfleming/dcaf_case_management/milestones?state=closed) to clearly scope our goals. We also beefed up our project [ReadMe](https://github.com/colinxfleming/dcaf_case_management/blob/master/README.md) with info for all types of contributors, worked to improve our recruiting and onboarding efforts at hacknights, and provided easy entry points for new contributors by tagging GitHub issues as [‘beginner-friendly’](https://github.com/colinxfleming/dcaf_case_management/issues?q=is%3Aopen+is%3Aissue+label%3A%22beginner+friendly%22). (We are both proud Michiganders, and believe a little bit of Midwestern Nice helped.) Within a few short weeks, we hooked some of our best, most-committed volunteer developers and built serious momentum for our project.

In the late spring, we agreed that it was time to get the app in front of more case managers to get feedback. We ran structured usability tests with three case managers and also tested the application on live calls for three nights of Lisa’s shift. We gathered feedback from these sessions and quickly made fixes ([proof!](https://github.com/colinxfleming/dcaf_case_management/issues/405)).

Finally, we stood up a secure system allowing for multiple concurrent users in August. Its major features include interactive call list planning, a gestation calculator, case histories and call logging, a straightforward patient record retrieval system, and data structures optimized for analytics use.

<center><img src="/images/blog/images/2016-09-09/dashboard.png" alt="The app dashboard" /></center>

## And it turned out great!

Since we began the project, over 35 designers and developers have contributed to the CM App. We are tremendously proud of our team’s diversity across gender, ethnicity, and coding experience. Out of the 30 individuals with commits on the project so far, nearly two-thirds are not white guys. And a number of them are recent code or design bootcamp graduates.

Best of all, we’re just getting started. The team gathered to plan our [second release](https://github.com/colinxfleming/dcaf_case_management/wiki/Sprint-%26-Release-Planning) in June, and we’re looking forward to feedback from case managers to improve the app. Next up, we’ll focus on DCAF’s weekly budget, auditing, and reporting needs.

<center><img src='/images/blog/images/2016-09-09/stickies.png' alt='Planning for the second release'/></center>

The team also has [bigger goals](https://github.com/colinxfleming/dcaf_case_management/wiki/Future-Dreams-for-Team-CM-App). We think that many other non-profits (and not just other abortion funds!) face technology problems similar to DCAF’s and this open-source application can be repurposed for wider use. If you’re interested in getting involved, contribute to the project or fork it for your own use! And if you’re inspired by our efforts and those of DCAF’s case managers, consider [making a donation to the Fund](https://dcabortionfund.org/donate).

We’re proud of our project and the way that a compelling problem, agile-inspired structure, user-centered design, a welcoming environment and a diverse team helped us succeed. Thank you so much to [everyone](https://github.com/colinxfleming/dcaf_case_management/wiki/Team-gratitude) who has contributed time, ideas, encouragement, and code to the DCAF CM App!
