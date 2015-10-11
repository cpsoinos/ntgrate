$(".mixfeeds.show").ready(function() {

  // var page = 1;

  // function getFeeds(page) {
  //   $.ajax({
  //     url: '/mixfeeds/' + gon.userId + '/retrieve_feeds',
  //     type: "GET",
  //     data: {page: page}
  //   });
  //   page += 1
  // }

  var $fbFilter = $("input[type='checkbox']#fb-filter")
  var $twFilter = $("input[type='checkbox']#tw-filter")
  var $igFilter = $("input[type='checkbox']#ig-filter")
  var $liFilter = $("input[type='checkbox']#li-filter")
  var $grid = $(".grid");

  $grid.imagesLoaded( function() {
    $grid.masonry();
  });

  // $fbFilter.val($(this).is(':checked'));
  // $twFilter.val($(this).is(':checked'));
  // $igFilter.val($(this).is(':checked'));
  // $liFilter.val($(this).is(':checked'));

  // filterChannel(fbFilter)
  // filterChannel(twFilter)
  // filterChannel(igFilter)
  // filterChannel(liFilter)

  $(".channel-filter").change(function() {
    filterChannel($(this))
  })

});

function filterChannel(channel) {
  channelShares = ("." + channel.attr("value"))
  if(channel.is(':checked')) {
    // ajax to refresh the feeds
    $.ajax({
      url: "/mixfeeds/" + gon.userId + "/insert_feeds",
      type: "GET",
      data: {channel: channel.attr("value")}
    });
  } else {
    $(".grid")
      .masonry('remove', $(channelShares))
      .masonry('layout');
  }
}
