$(".dashboards.show").ready(function() {

  $("#show-newsfeed").click(function() {
    $(".facebook-newsfeed").toggle("slow");
    $("#show-newsfeed").hide();
    $("#hide-newsfeed").show();
  });

  $("#hide-newsfeed").click(function() {
    $(".facebook-newsfeed").toggle("slow");
    $("#hide-newsfeed").hide();
    $("#show-newsfeed").show();
  });

  $("#facebook_share_facebook_page_id").change(function() {
    $(".facebook-newsfeed").empty().hide();
    $("#show-newsfeed").show();
    $("#hide-newsfeed").hide();
    newPageId = $(this).val();
    getFbFeed(newPageId, 5);
  });

  $("#show-timeline").click(function() {
    $(".twitter-timeline").toggle("slow");
    $("#show-timeline").hide();
    $("#hide-timeline").show();
  });

  $("#hide-timeline").click(function() {
    $(".twitter-timeline").toggle("slow");
    $("#hide-timeline").hide();
    $("#show-timeline").show();
  });

});
