class LandingPagesController < ApplicationController

  def index
    redirect_to mixfeed_path(current_user.mixfeed) if current_user.present?
  end

end
