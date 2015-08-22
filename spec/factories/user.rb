require 'factory_girl'

FactoryGirl.define do

  factory :user do
    first_name "John"
    last_name  "Doe"
    email
    password "supersecret"
    password_confirmation "supersecret"

    after(:create) { |user| user.create_dashboard }
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

end
