require 'factory_girl'

FactoryGirl.define do

  factory :facebook_page do
    name "#{Faker::Company.name} #{Faker::Company.suffix}"
    uid "123456"
    category "Real Estate"
    token "abcdefg"
    facebook_account
  end

end
