class TwitterSharesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js

  def create
    @twitter_account = current_user.twitter_account
    @twitter_share = @twitter_account.twitter_shares.new(twitter_share_params)
    if @twitter_share.save
      @twitter_share.share
      flash[:notice] = "Shared successfully to Twitter!"
      respond_to do |format|
        format.html do
          redirect_to dashboard_path(current_user.dashboard)
        end
        format.js do
          flash.now[:notice] = "Shared successfully to Twitter!"
        end
      end
    else
      redirect_to :back
    end
  end

  def retweet
    @twitter_account = current_user.twitter_account
    @tweet_uid = params[:tweet_uid]
    respond_to do |format|
      format.js do
        if TwitterActionTaker.new(@twitter_account, @tweet_uid).retweet
        else
          flash.now[:alert] = "Error sharing to Twitter"
        end
      end
    end
  end

  def favorite
    @twitter_account = current_user.twitter_account
    @tweet_uid = params[:tweet_uid]
    respond_to do |format|
      format.js do
        if TwitterActionTaker.new(@twitter_account, @tweet_uid).favorite
        else
          flash.now[:alert] = "Error saving favorite"
        end
      end
    end
  end

  def unfavorite
    @twitter_account = current_user.twitter_account
    @tweet_uid = params[:tweet_uid]
    respond_to do |format|
      format.js do
        if TwitterActionTaker.new(@twitter_account, @tweet_uid).unfavorite
        else
          flash.now[:alert] = "Error saving favorite"
        end
      end
    end
  end

  def reply
    @twitter_account = current_user.twitter_account
    @tweet_uid = params[:tweet_uid]
    respond_to do |format|
      format.js do
        if @reply = TwitterActionTaker.new(@twitter_account, @tweet_uid).reply(params[:content])
          flash.now[:notice] = "Shared successfully to Twitter!"
        else
          flash.now[:alert] = "Error replying to Tweet"
        end
      end
    end
  end

  protected

  def twitter_share_params
    params.require(:twitter_share).permit([:content, :link, :photo, :remote_photo_url, :video])
  end

end
