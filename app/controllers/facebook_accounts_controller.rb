class FacebookAccountsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @facebook_account = FacebookAccount.find(params[:id])
    @facebook_pages = @facebook_account.try(:facebook_pages)
    gon.facebook_pages = build_json_for_pages
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
