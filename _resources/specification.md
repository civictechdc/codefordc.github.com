---
layout: resource
title: Using civic.json Files
type: guide
edit_link: https://editfordc.herokuapp.com/document/7a9134aa-bf5b-4955-9137-c55df4308c24
---

# `civic.json` Specification

This is based on the work done by [BetaNYC](https://github.com/BetaNYC/civic.json/blob/master/specification.md).

## File Location and contents
1. `civic.json` shall reside in the root directory of a project's github repository.

2. `civic.json` shall include a single object represented as JSON, with the key/value pairs outlined below.

## Key/Value Pairs
1. `conformsTo` - the URL describing the format of the file. In this case, "http://codefordc.org/resources/specification.html".

2. `status` - text indicating the status of the project.  Any text is allowed, but a selection from the recommended values is advised:
  * `"Ideation"` - Brainstorming phase: user needs are being researched
  * `"Alpha"` - Initial prototyping phase and internal testing
  * `"Beta"` - A product is being tested in public
  * `"Production"` - Finished Product, development and maintenance ongoing
  * `"Archival"` - Finished Product, but no longer actively maintained

3. `thumbnailUrl` - a URL to an image associated with the project listing.

4. `contact` - an object containing `name`, `email`, and `twitter` objects, with each representing the preferred contact information for the project. At least one method should be available.

6. `geography` - text indicating the city, state, county, or other geographic entity this project is relevant to.  Any text is allowed.

    examples: "Washington, DC", "NYC", "Greater Baltimore"

8.  `governmentPartner` - an object indicating any political entity with which the project is working. The key is the entity's name, and the value is the entity's URL.

    example: {"DC Council": "http://www.dccouncil.washington.dc.us/"}

9.  `communityPartner` - an object indicating the community organizations with which the project is working. The key is the org's name, and the value is the org's URL.

    example: {"Bread for the City": "http://www.breadforthecity.org/"}

10. `type` - text describing the type of project.  Any text is allowed, but a selection from the recommended values is advised:
    * `"Web App"`
    * `"Mobile App"`
    * `"Policy Document"`
    * `"Dataset"`

11. `data` - an object of "dataset" objects. Add any datasets created by the project, and any useful third-party datasets used by the project. The key is the name of the dataset, and the value is the dataset's URL.

16. `moreInfo` - a URL to a document or site with more information about the project, such as a Hackpad or Google Doc.

## Example civic.json

```
{
    "conformsTo": "http://codefordc.org/resources/specification.html",
    "status": "Production",
    "thumbnailUrl":"http://example.com/static/img/favicon.png",
    "contact":
    {
        "name": "",
        "email": "contactus@example.com",
        "twitter": "@codefordc"
    },
    "bornAt": "Code for DC",
    "geography": "DC",
    "communityPartner": {"Community Organization":"http://example.com"},
    "politicalEntity": {"Office of Something":"http://something.dc.gov/"},
    "governmentPartner": {},
    "type": "Web App",
    "data": {
        "A Useful Dataset":"http://example.com/dataset",
        "Another Dataset":"http://example.com/otherstuff"
    },
    "needs": [
        {"need":"Ruby on Rails"},
        {"want":"Spreadsheet Experts"}
    ],
    "categories": [
        {"category":"Politics"},
        {"category":"Government"},
        {"category":"Open Data"}
    ],
    "moreInfo": ""
}
```
