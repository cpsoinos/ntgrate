class TwitterActionTaker
  include TwitterAccountable

  def initialize(twitter_account, share_uid)
    @twitter_account = twitter_account
    @share_uid = share_uid
  end

  def retweet
    client.retweet(@share_uid)
  end

  def favorite
    client.favorite(@share_uid)
  end

  def unfavorite
    client.unfavorite(@share_uid)
  end

  def reply(content)
    client.update(content)
  end

end
