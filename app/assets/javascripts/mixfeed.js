$(".mixfeeds.show").ready(function() {

  var accountId = gon.facebook_account_id;

  getFeed(accountId, 10);

});
