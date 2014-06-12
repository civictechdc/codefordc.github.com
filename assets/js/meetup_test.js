// Dependencies: jQuery

/*
 * Data about the Meetup.com API
 */
var meetup = {
  url: 'http://api.meetup.com',
  paths: {
    events: '/2/events'
  }
}

/*
 * Data specific to us (codefordc) and the events endpoint
 * Try to get all the upcoming events for our meetup!
 */
var signed_events_data = {
  status: 'upcoming',
  order: 'time',
  limited_events: 'False',
  group_urlname: 'Code-for-DC',
  desc: 'false',
  offset: 0,
  format: 'json',
  page: '20',
  fields: '',
  sig_id: '49005422',
  sig: '7caf9d51fb9b642478a48f51e2fcf773fd700578'
};

function getMeetupEvents() {
  return $.ajax({
    url: meetup.url + meetup.paths.events,
    dataType: 'jsonp',
    data: signed_events_data
  });
}

function fillInMeetupEventTemplate(response) {
  var first = response.results[0];
  var venue = first.venue;

  // General
  $('.description').html(first.description);
  $('.nameWrap .url').html(first.name)
      .attr('href', first.url);

  // Venue
  $('.address_1').html(venue.address_1);
  $('.city').html(venue.city);
  $('.name').html(venue.name);
}

function log(a) {
  console.log(a);
};

$(function () {
  getMeetupEvents()
    .then(fillInMeetupEventTemplate);
})
