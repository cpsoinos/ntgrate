class FacebookFeedRetriever
  include FacebookGraphable

  def initialize(facebook_page, limit)
    @facebook_page = facebook_page
    @limit = limit
  end

  def get_feed
    @feed = graph.get_connection("me", "posts", {
      limit: @limit,
      fields: [
        'message',
        'id',
        'from',
        'type',
        'full_picture',
        'link',
        'created_time',
        'updated_time',
        'likes',
        'comments'
      ]
    })
  end

end
