class FacebookSharesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js

  def create
    @facebook_page = FacebookPage.find(params[:facebook_share][:facebook_page_id])
    @facebook_share = @facebook_page.facebook_shares.new(facebook_share_params)
    if @facebook_share.save
      @facebook_share.share
      flash[:notice] = "Shared successfully to Facebook!"
      respond_to do |format|
        format.html do
          redirect_to dashboard_path(current_user.dashboard)
        end
        format.js do
          flash.now[:notice] = "Shared successfully to Facebook!"
        end
      end
    else
      redirect_to :back
    end
  end

  def update
    @facebook_share = FacebookShare.find(params[:id])
  end

  def destroy
    @facebook_share = FacebookShare.find(params[:id])
    @facebook_share.delete_share
  end

  def boost
    @facebook_page = FacebookPage.find(params[:facebook_page_id])
    @facebook_share = FacebookShare.find_by(share_id: params[:share_id])
    FacebookShareBooster.new(@facebook_page, params[:share_id]).boost
  end

  protected

  def facebook_share_params
    params.require(:facebook_share).permit([:content, :link, :photo, :remote_photo_url, :video])
  end

end
