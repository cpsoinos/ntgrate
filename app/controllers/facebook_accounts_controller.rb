class FacebookAccountsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @facebook_account = FacebookAccount.find(params[:id])
    @facebook_pages = @facebook_account.try(:facebook_pages)
  end

end
