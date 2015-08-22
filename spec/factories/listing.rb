require 'factory_girl'

FactoryGirl.define do

  factory :listing do
    address Faker::Address.street_address
    address_2 Faker::Address.secondary_address
    city Faker::Address.city
    state Faker::Address.state
    zip Faker::Address.zip
    asking_price Faker::Commerce.price
    sold_for Faker::Commerce.price
    mls_number Faker::Code.ean
    listed_at Faker::Date.backward(21)
    description Faker::Lorem.paragraph
    bedrooms 3
    bathrooms 2.5
    built 1990
    listing_type "for_sale"
    pets_allowed true
    square_feet 1200
    user

    trait :sold do
      sold_at Faker::Date.backward(2)
      status "sold"
    end

    trait :active do
      status "active"
    end

    trait :inactive do
      status "inactive"
    end
  end

end
