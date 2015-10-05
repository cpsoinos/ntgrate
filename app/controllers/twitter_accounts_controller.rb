class TwitterAccountsController < ApplicationController
  respond_to :js
  before_filter :authenticate_user!

  def feed
    @twitter_account = TwitterAccount.find(params[:account_id].to_i)
    @feed = TwitterFeedRetriever.new(@twitter_account, params[:limit]).get_feed
  end

  def home_feed
    @twitter_account = TwitterAccount.find(params[:account_id].to_i)
    @feed = TwitterFeedRetriever.new(@twitter_account, params[:limit]).get_home_feed
    render :feed
  end

end
