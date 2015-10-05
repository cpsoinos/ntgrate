$(".mixfeeds.show").ready(function() {

  var fbAccountId = gon.facebook_account_id;
  var twAccountId = gon.twitter_account_id;
  var igAccountId = gon.instagram_account_id;
  var feedItems;

  if(fbAccountId) {
    getFbFeed(fbAccountId, 10);
  }
  if(twAccountId) {
    getTwHomeFeed(twAccountId, 10);
  }
  if(igAccountId) {
    getIgHomeFeed(igAccountId, 10);
  }

});
