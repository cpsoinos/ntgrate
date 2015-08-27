require 'factory_girl'

FactoryGirl.define do

  factory :instagram_account do
    uid "123"
    token "xyz"
    identity { create(:identity, :instagram) }
  end

end
