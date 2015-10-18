require 'factory_girl'

FactoryGirl.define do

  factory :twitter_account do
    token "xyz"
    secret "supersecret"
    handle "@PrincessPeach"
    uid "123"
    identity { create(:identity, :twitter) }
    account_url "http://twitter.com/PrincessPeach"

    trait :test do
      token "3578893755-If0SL1j4UJLuhpuDnuHWMc0rPBoNJVE2YsGWWwp"
      secret "2RvSO7p1ohVY7OPBBydUzsfRdz6jdYy3YLwkIv9iHbtE6"
      handle "@corey_test"
      uid "3578893755"
      account_url "https://twitter.com/corey_test"
      picture "http://abs.twimg.com/sticky/default_profile_images/default_profile_3_normal.png"
    end
  end

end
