class TwitterTimelineRetriever
  include TwitterAccountable

  def initialize(twitter_account)
    @twitter_account = twitter_account
  end

  def get_timeline
    @timeline = client.user_timeline(@twitter_account.uid.to_i, {
      count: 5
    })
    # @timeline = @timeline.map { |tweet| client.oembed("#{tweet.id}") }
  end

end
