class TwitterSharesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @twitter_account = current_user.twitter_account
    @twitter_share = @twitter_account.twitter_shares.new(twitter_share_params)
    if @twitter_share.save
      @twitter_share.share
      flash[:notice] = "Shared successfully to Twitter!"
      redirect_to dashboard_path(current_user.dashboard)
    else
      redirect_to :back
    end
  end

  protected

  def twitter_share_params
    params.require(:twitter_share).permit([:content, :link, :photo, :remote_photo_url, :video])
  end

end
