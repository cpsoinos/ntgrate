require 'factory_girl'

FactoryGirl.define do

  factory :twitter_account do
    token "abc"
    secret "supersecret"
    handle "@PrincessPeach"
    uid "123"
    identity
  end

end
