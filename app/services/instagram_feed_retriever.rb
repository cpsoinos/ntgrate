class InstagramFeedRetriever
  include InstagramClientable

  def initialize(instagram_account, limit)
    @instagram_account = instagram_account
    @limit = limit
  end

  def get_feed
    @feed = client.user_recent_media
  end

  def get_home_feed
    @feed = client.user_media_feed
  end
end
