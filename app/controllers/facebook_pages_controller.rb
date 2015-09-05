class FacebookPagesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @facebook_page = FacebookPage.new
  end

  def create
    @facebook_page = current_user.facebook_account.facebook_pages.new(facebook_page_params)
  end

  def update

  end

  def destroy

  end

  protected

  def facebook_page_params
    params.require(:facebook_page).permit([:token, :category, :name, :uid])
  end

end
