class FacebookPagesController < ApplicationController
  respond_to :js, :html
  before_filter :authenticate_user!

  def new
    @facebook_page = FacebookPage.new
  end

  def create
    @facebook_page = current_user.facebook_account.facebook_pages.new(facebook_page_params)
  end

  # def update
  #
  # end
  #
  # def destroy
  #
  # end

  def feed
    respond_to do |format|
      format.js do
        @facebook_page = FacebookPage.find(params[:object_id].to_i)
        @feed = FacebookFeedRetriever.new(@facebook_page, params[:limit]).get_feed
      end
    end
  end

  protected

  def facebook_page_params
    params.require(:facebook_page).permit([:token, :category, :name, :uid])
  end

end
