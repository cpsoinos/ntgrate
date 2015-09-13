module OmniauthMacros
  def mock_auth_hash
    mock_hash = {
      "provider" => "facebook",
      "uid" => fb_test_user["id"],
      "credentials" => {"token" => fb_test_user["access_token"]},
      "info" => {
        "nickname" => "Nancy",
        "email" => "ocgfwod_martinazziescu_1442154183@tfbnw.net",
        "name" => graph.get_object("me")["name"],
        "first_name" => "Nancy",
        "last_name" => "Martinazziescu",
        "verified" => true
      }
    }
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(mock_hash)
  end

  def sign_in_with_facebook
    visit root_path
    click_on("Sign in with Facebook")
  end

  def create_from_omniauth
    User.find_for_oauth(mock_auth_hash)
  end

  def fb_test_users
    @_test_users ||= Koala::Facebook::TestUsers.new(app_id: ENV["FACEBOOK_APP_ID"], secret: ENV["FACEBOOK_APP_SECRET"])
  end

  def fb_test_user
    @_test_user ||= fb_test_users.list.last
  end

  def graph
    @graph = Koala::Facebook::API.new(fb_test_user["access_token"])
  end

end
