class MixfeedsController < ApplicationController
  before_filter :authenticate_user!

  def show
    unless current_user.present? && current_user.mixfeed.id = params[:id].to_i
      flash[:notice] = "Please sign in or register to continue."
      redirect_to new_user_session_path
    end

    if current_user.facebook_account
      @facebook_account = current_user.facebook_account
      gon.facebook_account_id = @facebook_account.id
      @facebook_pages = @facebook_account.try(:facebook_pages)
    end

    if current_user.twitter_account
      @twitter_account = current_user.twitter_account
      gon.twitter_account_id = @twitter_account.id
    end

    if current_user.instagram_account
      @instagram_account = current_user.instagram_account
      gon.instagram_account_id = @instagram_account.id
    end

    if current_user.linkedin_account
      @linkedin_account = current_user.linkedin_account
    end

    @facebook_share = FacebookShare.new
    @twitter_share = TwitterShare.new
  end

end
