class TwitterAccountsController < ApplicationController
  respond_to :js
  before_filter :authenticate_user!

  def timeline
    @twitter_account = TwitterAccount.find(params[:account_id].to_i)
    @timeline = TwitterTimelineRetriever.new(@twitter_account).get_timeline
  end

end
