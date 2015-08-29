class DashboardsController < ApplicationController
  before_filter :authenticate_user!

  def show
    unless current_user.present? && current_user.dashboard.id = params[:id].to_i
      flash[:notice] = "Please sign in or register to continue."
      redirect_to new_user_session_path
    end
    @listings = Dashboard.find(params[:id]).user.listings
    @facebook_account = current_user.facebook_account
    @twitter_account = current_user.twitter_account
    @instagram_account = current_user.instagram_account
    @linkedin_account = current_user.twitter_account
  end

end
