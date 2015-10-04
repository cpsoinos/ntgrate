class TwitterFeedRetriever
  include TwitterAccountable

  def initialize(twitter_account)
    @twitter_account = twitter_account
  end

  def get_feed
    @feed = client.user_timeline(@twitter_account.uid.to_i, {
      count: 5
    })
  end

end
