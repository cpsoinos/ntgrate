class FacebookFeedRetriever
  include FacebookGraphable

  def initialize(object, limit)
    @object = object
    @limit = limit
  end

  def get_feed
    @feed = graph.get_connection("me", "feed", {
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
