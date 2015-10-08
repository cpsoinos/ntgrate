$(".mixfeeds.show").ready(function() {

  var page = 1;

  function getFeeds(page) {
    $.ajax({
      url: '/mixfeeds/' + gon.userId + '/retrieve_feeds',
      type: "GET",
      data: {page: page}
    });
    page += 1
  }

  var $grid = $('.grid');

  $grid.imagesLoaded( function() {
    $grid.masonry();
  });

});
