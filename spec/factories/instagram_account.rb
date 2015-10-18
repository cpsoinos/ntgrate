require 'factory_girl'

FactoryGirl.define do

  factory :instagram_account do
    uid "123"
    token "xyz"
    identity { create(:identity, :instagram) }

    trait :test do
      uid "2240370469"
      token "2240370469.92f033e.64737687d75245e1945ac9c4c5b097e5"
      username "testacctntgrate"
      account_url "https://instagram.com/testacctntgrate"
      picture "https://scontent.cdninstagram.com/hphotos-xaf1/t51.2885-19/s150x150/12081198_415612321971519_1327520224_a.jpg"
    end
  end

end
