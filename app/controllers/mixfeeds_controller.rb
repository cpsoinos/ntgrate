class MixfeedsController < ApplicationController
  before_filter :authenticate_user!

  def show
    unless current_user.present? && current_user.mixfeed.id = params[:id].to_i
      flash[:notice] = "Please sign in or register to continue."
      redirect_to new_user_session_path
    end

    @facebook_account = current_user.facebook_account
    gon.facebook_account_id = @facebook_account.id
    @facebook_pages = @facebook_account.try(:facebook_pages)

    @twitter_account = current_user.twitter_account

    @instagram_account = current_user.instagram_account

    @linkedin_account = current_user.twitter_account

    @facebook_share = FacebookShare.new
    @twitter_share = TwitterShare.new
  end

end
