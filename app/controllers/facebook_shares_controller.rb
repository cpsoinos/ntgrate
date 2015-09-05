class FacebookSharesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @facebook_share = FacebookShare.new
  end

  def create
    @facebook_page = FacebookPage.find(params[:facebook_share][:facebook_page_id])
    @facebook_share = @facebook_page.facebook_shares.new(facebook_share_params)
    binding.pry
    if @facebook_share.save
      @facebook_share.share
      flash[:notice] = "Shared successfully to Facebook!"
      redirect_to dashboard_path(current_user.dashboard)
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

  protected

  def facebook_share_params
    params.require(:facebook_share).permit([:content, :link])
  end

end
