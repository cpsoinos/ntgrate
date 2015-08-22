class FacebookPagesController < ApplicationController

  def new
    @facebook_page = FacebookPage.new
  end

  def create
    @user = User.find(params[:user_id])
    request.env['omniauth.auth']['credentials']
    @facebook_page = @user.build_facebook_page(facebook_page_params)
  end

  def update
    @facebook_page = FacebookPage.find(params[:id])
  end

  def destroy

  end

  protected

  def facebook_page_params
    # sanitize the params
  end

  def swap_for_long_term_token

  end

  def oauth
  end

end
