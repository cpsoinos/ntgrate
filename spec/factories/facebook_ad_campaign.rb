require 'factory_girl'

FactoryGirl.define do

  factory :facebook_ad_campaign do
    ad_campaign_id "12345"
    name "My Ad Campaign"
    objective "Website conversions"
    start_time DateTime.now
    stop_time (DateTime.now + 10)
    spend_cap_cents 2500
    spend_cap_currency "USD"
  end

end
