require 'factory_girl'

FactoryGirl.define do

  factory :identity do
    uid "123abc"
    user

    trait :facebook do
      provider "facebook"
    end

    trait :twitter do
      provider "twitter"
    end
  end
end
