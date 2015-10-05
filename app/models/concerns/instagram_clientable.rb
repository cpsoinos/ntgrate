module InstagramClientable
  extend ActiveSupport::Concern

  def client
    @_client = Instagram.client(access_token: @instagram_account.token)
  end

end
