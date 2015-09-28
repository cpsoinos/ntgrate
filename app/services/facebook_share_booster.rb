class FacebookShareBooster
  include FacebookGraphable

  def initialize(facebook_page, share_id)
    @facebook_page = facebook_page
    @share_id = share_id
  end

  def boost
    # do something
  end

end
