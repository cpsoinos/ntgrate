require 'factory_girl'

FactoryGirl.define do

  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email
    password "supersecret"
    password_confirmation "supersecret"
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

end
