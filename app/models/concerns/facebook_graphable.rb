module FacebookGraphable
  extend ActiveSupport::Concern

  def graph
    Koala::Facebook::API.new(@object.token, ENV["FACEBOOK_APP_SECRET"])
  end

end
