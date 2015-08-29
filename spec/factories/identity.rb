require 'factory_girl'

FactoryGirl.define do

  factory :identity do
    uid
    user

    trait :facebook do
      provider "facebook"
    end

    trait :twitter do
      provider "twitter"
    end

    trait :instagram do
      provider "instagram"
    end
  end

  sequence :uid do |n|
    "abc#{n}"
  end
end
