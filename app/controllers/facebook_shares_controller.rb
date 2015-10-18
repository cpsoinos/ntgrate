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

  def like
    @facebook_account = current_user.facebook_account
    @share_uid = params[:share_uid]
    respond_to do |format|
      format.js do
        if FacebookActionTaker.new(@facebook_account, @share_uid).like
        else
          flash.now[:alert] = "Error posting to Facebook"
        end
      end
    end
  end

  def unlike
    @facebook_account = current_user.facebook_account
    @share_uid = params[:share_uid]
    respond_to do |format|
      format.js do
        if FacebookActionTaker.new(@facebook_account, @share_uid).unlike
        else
          flash.now[:alert] = "Error posting to Facebook"
        end
      end
    end
  end

  def comment
    @facebook_account = current_user.facebook_account
    @share_uid = params[:share_uid]
    @text = params[:text]
    respond_to do |format|
      format.js do
        if FacebookActionTaker.new(@facebook_account, @share_uid).comment(@text)
          flash.now[:notice] = "Comment successfully posted on Facebook!"
        else
          flash.now[:alert] = "Error posting to Facebook"
        end
      end
    end
  end

  def reshare
    @facebook_account = current_user.facebook_account
    @share_uid = params[:share_uid]
    @text = params[:text]
    @link = params[:link]
    respond_to do |format|
      format.js do
        if FacebookActionTaker.new(@facebook_account, @share_uid).reshare(@text, @link)
          flash.now[:notice] = "Successfully posted on Facebook!"
        else
          flash.now[:alert] = "Error posting to Facebook"
        end
      end
    end
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
