class InstagramAccountsController < ApplicationController
  respond_to :js
  before_filter :authenticate_user!

  def feed
    @instagram_account = InstagramAccount.find(params[:account_id].to_i)
    @feed = InstagramFeedRetriever.new(@instagram_account, params[:limit]).get_feed
  end

  def home_feed
    @instagram_account = InstagramAccount.find(params[:account_id].to_i)
    @feed = InstagramFeedRetriever.new(@instagram_account, params[:limit]).get_home_feed
    render :feed
  end

end
