class FacebookFeedRetriever
  include FacebookGraphable

  def initialize(facebook_page)
    @facebook_page = facebook_page
  end

  def get_feed
    @feed = graph.get_connections("me", "feed")
  end

  def get_share(share_id)
    graph.get_object(share_id)
  end

end
