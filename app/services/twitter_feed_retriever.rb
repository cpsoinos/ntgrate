class TwitterFeedRetriever
  include TwitterAccountable

  def initialize(twitter_account, limit)
    @twitter_account = twitter_account
    @limit = limit
  end

  def get_feed
    @feed = client.user_timeline(@twitter_account.uid.to_i, {
      count: @limit
    })
  end

  def get_home_feed
    @feed = client.home_timeline(
      count: @limit
    )
  end

end
