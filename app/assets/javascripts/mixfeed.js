$(".mixfeeds.show").ready(function() {

  var $grid = $(".grid");

  $grid.imagesLoaded( function() {
    $grid.masonry();
  });
});
