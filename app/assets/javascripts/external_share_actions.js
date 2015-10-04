function getFbFeed(objectId, limit) {
  var feedUrl;
  if ($("body").hasClass("dashboards")) {
    feedUrl = "/facebook_pages/feed";
  }
  else {
    feedUrl = "/facebook_accounts/" + objectId + "/feed";
  }

  $.ajax({
    url: feedUrl,
    type: "GET",
    data: {object_id: objectId, limit: limit}
  });
}
