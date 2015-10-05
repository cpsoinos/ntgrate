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

function getTwFeed(accountId, limit) {
  $.ajax({
    url: ("/twitter_accounts/feed"),
    type: "GET",
    data: {account_id: accountId, limit: limit}
  });
}

function getTwHomeFeed(accountId, limit) {
  $.ajax({
    url: ("/twitter_accounts/home_feed"),
    type: "GET",
    data: {account_id: accountId, limit: limit}
  });
}

function getIgHomeFeed(accountId, limit) {
  $.ajax({
    url: ("/instagram_accounts/home_feed"),
    type: "GET",
    data: {account_id: accountId, limit: limit}
  });
}
