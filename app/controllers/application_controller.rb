class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def get_social_accounts
    if current_user.present?
      @facebook_account = current_user.facebook_account if current_user.facebook_account
      @twitter_account = current_user.twitter_account if current_user.twitter_account
      @instagram_account = current_user.instagram_account if current_user.instagram_account
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name]
  end
end
