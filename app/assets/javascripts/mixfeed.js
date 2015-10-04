$(".mixfeeds.show").ready(function() {

  var fbAccountId = gon.facebook_account_id;

  getFbFeed(fbAccountId, 10);
  getTwFeed(twAccountId);

});
