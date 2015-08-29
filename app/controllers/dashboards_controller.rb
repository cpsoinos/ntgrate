class DashboardsController < ApplicationController

  def show
    unless current_user.present? && current_user.dashboard.id = params[:id].to_i
      flash[:notice] = "Please sign in or register to continue."
      redirect_to new_user_session_path
    end
    @listings = Dashboard.find(params[:id]).user.listings
  end

end
