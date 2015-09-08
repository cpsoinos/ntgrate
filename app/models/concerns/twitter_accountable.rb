module TwitterAccountable
  extend ActiveSupport::Concern

  def client
    client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_SECRET"]
      config.access_token        = twitter_account.token
      config.access_token_secret = twitter_account.secret
    end
  end

end
