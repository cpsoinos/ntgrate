require 'factory_girl'

FactoryGirl.define do

  factory :twitter_share do
    content Faker::Lorem.sentence
    share_url ""
    share_id "7867"
    twitter_account

    # trait :photo do
    #   photo "spec/fixtures/test.png"
    # end
  end

end
