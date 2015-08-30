class FacebookSharesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @facebook_share = FacebookShare.new
  end

  def create
    @facebook_account = current_user.facebook_account
    @facebook_share = @facebook_account.facebook_shares.new(facebook_share_params)
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

  private

  def facebook_share_params
    params.require(:facebook_share).permit([:content, :link])
  end

end
