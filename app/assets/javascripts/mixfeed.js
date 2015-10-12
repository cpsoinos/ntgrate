$(".mixfeeds.show").ready(function() {

  var $grid = $(".grid");

  $grid.imagesLoaded( function() {
    $grid.masonry();
  });

  $(".tweet-reply").click(function(ev) {
    ev.preventDefault();
    var tweetId = ("#" + $(this).attr("data"));
    var replyForm = tweetId + "-reply-form"
    var replyField = tweetId + "-reply-field"
    var replyButton = tweetId + "-reply-button"
    var charsMessage = tweetId + "-message"
    debugger;
    $(replyForm).show();
    $(".grid").masonry();

    $("#tweet").attr("disabled", "disabled");
    $(replyField).keyup(function(){
      var chars = $(this).val().length;
      $(charsMessage).text(140 - chars);

      if(chars > 140 || chars <= 0) {
        $(replyButton).attr("disabled", "disabled");
        $(charsMessage).addClass("minus");

      } else {
        $(replyButton).removeAttr("disabled");
        $(charsMessage).removeClass("minus");
      }
    });
  })

});
