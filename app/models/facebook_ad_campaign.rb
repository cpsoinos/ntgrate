class FacebookAdCampaign < ActiveRecord::Base
  has_many :facebook_ad_sets

  monetize :spend_cap_cents

end
