$(document).ready(function() {

  $("#show-newsfeed").click(function() {
    // alert( "Handler for .click() called." );
    $(".facebook-newsfeed").toggle("slow");
    $("#show-newsfeed").hide();
    $("#hide-newsfeed").show();
  });

  $("#hide-newsfeed").click(function() {
    // alert( "Handler for .click() called." );
    $(".facebook-newsfeed").toggle("slow");
    $("#hide-newsfeed").hide();
    $("#show-newsfeed").show();
  });

  $("#facebook_share_facebook_page_id").change(function() {
    $(".facebook-newsfeed").empty().hide();
    $("#show-newsfeed").show();
    $("#hide-newsfeed").hide();
    newPageId = $(this).val();
    getFeed(newPageId);
  });

});
