require 'factory_girl'

FactoryGirl.define do

  factory :facebook_page do
    name "#{Faker::Company.name} #{Faker::Company.suffix}"
    sequence(:uid) { |n| "#{n}abc123" }
    category "Real Estate"
    token "abcdefg"
    facebook_account
    page_url "https://www.facebook.com/some_page_url"
  end

end
