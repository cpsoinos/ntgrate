class LandingPagesController < ApplicationController

  def index
    redirect_to dashboard_path(current_user.dashboard) if current_user.present?
  end

end
