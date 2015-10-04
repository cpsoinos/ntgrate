class FacebookAccountsController < ApplicationController
  respond_to :js, :html
  before_filter :authenticate_user!

  def show
    @facebook_account = FacebookAccount.find(params[:id])
    @facebook_pages = @facebook_account.try(:facebook_pages)
    gon.facebook_pages = build_json_for_pages
  end

  def feed
    respond_to do |format|
      format.js do
        @facebook_account = FacebookAccount.find(params[:object_id].to_i)
        @feed = FacebookFeedRetriever.new(@facebook_account, params[:limit]).get_feed
      end
    end
  end

  private

  def build_json_for_pages
    @facebook_pages.map do |page|
      {
        text: page.name,
        value: page.id,
        selected: false,
        description: page.category,
        imageSrc: page.picture
      }
    end.to_json
  end

end
