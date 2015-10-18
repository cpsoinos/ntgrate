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

  def follow(handle)
    client.follow(handle)
  end

  def unfollow(handle)
    client.unfollow(handle)
  end

  def fetch_user(user)
    client.user(user)
  end

  def followers
    client.followers
  end

  def find_followers(user)
    client.followers(user)
  end

  def find_timeline(user)
    client.user_timeline(user)
  end

  def mentions
    client.mentions_timeline
  end

  def fetch_tweet(share_id)
    client.status(share_id)
  end

  def tweets
    client.statuses(twitter_shares.pluck(:share_id))
  end

end
