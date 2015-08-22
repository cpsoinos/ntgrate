class UsersController < ApplicationController
  before_action :authorize_user, except: [:create, :new]

  def new

  end

  def create

  end

  protected

  def user_params

  end
  
end
