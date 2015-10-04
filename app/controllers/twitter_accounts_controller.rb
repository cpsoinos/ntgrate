class TwitterAccountsController < ApplicationController
  respond_to :js
  before_filter :authenticate_user!

  def feed
    @twitter_account = TwitterAccount.find(params[:account_id].to_i)
    @feed = TwitterFeedRetriever.new(@twitter_account).get_feed
  end

end
