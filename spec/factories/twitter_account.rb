require 'factory_girl'

FactoryGirl.define do

  factory :twitter_account do
    token "xyz"
    secret "supersecret"
    handle "@PrincessPeach"
    uid "123"
    identity { create(:identity, :twitter) }
    account_url "http://twitter.com/PrincessPeach"
  end

end
