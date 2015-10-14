$(".mixfeeds.show").ready(function() {

  var $grid = $(".grid");

  $grid.imagesLoaded( function() {
    $grid.masonry();
  });

  // Twitter
  $(".tweet-reply").click(function(ev) {
    ev.preventDefault();
    var tweetId = ("#" + $(this).attr("data"));
    var replyForm = tweetId + "-reply-form"
    var replyField = tweetId + "-reply-field"
    var replyButton = tweetId + "-reply-button"
    var charsMessage = tweetId + "-message"
    $(replyForm).toggle("fast");
    setTimeout(function() {
      $(".grid").masonry()
    }, 250);

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

  // Facebook
  $(".share-comment").click(function(ev) {
    ev.preventDefault();
    var shareId = ("#" + $(this).attr("data"));
    var commentForm = shareId + "-comment-form"
    var commentField = shareId + "-comment-field"
    var commentButton = shareId + "-comment-button"
    var charsMessage = shareId + "-message"
    $(commentForm).toggle("fast");
    setTimeout(function() {
      $(".grid").masonry()
    }, 250);
  })

});
