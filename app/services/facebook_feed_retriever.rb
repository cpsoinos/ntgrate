class FacebookFeedRetriever
  include FacebookGraphable

  def initialize(facebook_page)
    @facebook_page = facebook_page
  end

  def get_feed
    @feed = graph.get_connection("me", "posts", {
      limit: 5,
      fields: [
        'message',
        'id',
        'from',
        'type',
        'picture',
        'link',
        'created_time',
        'updated_time'
      ]
    })
  end

end
