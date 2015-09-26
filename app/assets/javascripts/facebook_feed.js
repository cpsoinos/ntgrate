function getFeed(pageId, limit) {
  $.ajax({
    url: ("/facebook_pages/feed"),
    type: "GET",
    data: {page_id: pageId, limit: limit}
  });
}
