class DashboardsController < ApplicationController

  def show
    redirect_to landing_pages_path unless current_user.present? && current_user.dashboard.id == params[:id].to_i
    @listings = Dashboard.find(params[:id]).user.listings
  end

end
