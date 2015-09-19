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

});
