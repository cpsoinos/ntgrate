require 'factory_girl'

FactoryGirl.define do

  factory :facebook_ad_set do
    ad_set_id "5678"
    ad_campaign_id "12345"
    start_time DateTime.now
    stop_time (DateTime.now + 10)
    name "My Ad Set"
    optimization_goal "some goal"
    bid_amount 99
    lifetime_budget_cents 8999
    daily_budget_cents 999
    facebook_ad_campaign
  end

end
