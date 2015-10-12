class MixfeedRetriever

  def initialize(user, limit)
    @user = user
    @limit = limit
  end

  def retrieve_feeds
    @feeds = []
    retrieve_fb_feed
    retrieve_tw_feed
    retrieve_ig_feed
    @feeds.flatten!
  end

  def order_feeds
    retrieve_feeds

    @feeds.sort do |a, b|
      parse_date(b) <=> parse_date(a)
    end
  end

  private

  def retrieve_fb_feed
    if @user.facebook_account
      @feeds << FacebookFeedRetriever.new(@user.facebook_account, @limit).get_feed
    end
  end

  def retrieve_tw_feed
    if @user.twitter_account
      @feeds << TwitterFeedRetriever.new(@user.twitter_account, @limit).get_home_feed
    end
  end

  def retrieve_ig_feed
    if @user.instagram_account
      @feeds << InstagramFeedRetriever.new(@user.instagram_account, @limit).get_home_feed
    end
  end

  def parse_date(share)
    if share.is_a?(Hashie::Mash)
      Time.at(share.created_time.to_i).to_datetime
    elsif share.is_a?(Twitter::Tweet)
      share.created_at.to_datetime
    else
      share["created_time"].to_datetime
    end
  end

end
