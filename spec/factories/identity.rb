require 'factory_girl'

FactoryGirl.define do

  factory :identity do
    uid "123abc"
    token "789xyz"
    user

    trait :facebook do
      provider "facebook"
    end

    trait :twitter do
      provider "twitter"
    end
  end
end
