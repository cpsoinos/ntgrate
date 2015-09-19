require 'factory_girl'

FactoryGirl.define do

  factory :facebook_share do
    content Faker::Lorem.paragraph
    share_url ""
    share_id "7867_1234"
    facebook_page

    trait :link do
      link Faker::Internet.url
    end
  end

end
