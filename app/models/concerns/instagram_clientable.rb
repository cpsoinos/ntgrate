module InstagramClientable
  extend ActiveSupport::Concern

  def client
    @_client = Instagram.client(access_token: current_user.instagram_account.token)
  end

end
