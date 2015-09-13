module FacebookGraphable
  extend ActiveSupport::Concern

  def graph
    Koala::Facebook::API.new(@facebook_page.token, ENV["FACEBOOK_APP_SECRET"])
  end

end
