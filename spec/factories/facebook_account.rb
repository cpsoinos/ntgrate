require 'factory_girl'

FactoryGirl.define do

  factory :facebook_account do
    uid "123"
    token "xyz"
    identity { create(:identity, :facebook) }
  end

end
