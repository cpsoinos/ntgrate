class MixfeedsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_facebook_account
  before_filter :get_twitter_account
  before_filter :get_instagram_account
  before_filter :get_linkedin_account

  def show
    unless current_user.present? && current_user.mixfeed.id = params[:id].to_i
      flash[:notice] = "Please sign in or register to continue."
      redirect_to new_user_session_path
    end

    gon.userId = current_user.id
    @facebook_share = FacebookShare.new
    @twitter_share = TwitterShare.new
    @feeds = retrieve_feeds
  end

  protected

  def retrieve_feeds
    @feeds = MixfeedRetriever.new(current_user, 10).order_feeds
  end

  protected

  def get_facebook_account
    if current_user.facebook_account
      @facebook_account = current_user.facebook_account
      gon.facebook_account_id = @facebook_account.id
      @facebook_pages = @facebook_account.try(:facebook_pages)
    end
  end

  def get_twitter_account
    if current_user.twitter_account
      @twitter_account = current_user.twitter_account
      gon.twitter_account_id = @twitter_account.id
    end
  end

  def get_instagram_account
    if current_user.instagram_account
      @instagram_account = current_user.instagram_account
      gon.instagram_account_id = @instagram_account.id
    end
  end

  def get_linkedin_account
    if current_user.linkedin_account
      @linkedin_account = current_user.linkedin_account
    end
  end

end
