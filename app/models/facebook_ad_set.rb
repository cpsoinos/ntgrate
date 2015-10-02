class FacebookAdSet < ActiveRecord::Base
  belongs_to :facebook_ad_campaign

  monetize :bid_amount_cents
  monetize :lifetime_budget_cents
  monetize :daily_budget_cents

end
