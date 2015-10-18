require 'factory_girl'

FactoryGirl.define do

  factory :facebook_account do
    uid "123"
    token "xyz"
    identity { create(:identity, :facebook) }

    trait :test do
      token "CAABZCqcXkxuUBANoMuv8J0uQIl5VQFMEEXkBZBZCHe64h1Vj0uaCjyTiAW7yUPQ71VltdBJoMzUiNFGgfWzYTjuuYCqNBh6dfqbqDucK7Yq4Ek1D3LLnZAR1kjb935V2pGcAVzcRBVNHaZAyZCYm4V3rloL9BCIVDKbdgAsd7ShBgaZAXtSGJNiJCoj4hp2gtwZD"
      uid "104124393281645"
      picture "http://graph.facebook.com/104124393281645/picture"
      name "Corey Psoinos"
      account_url "https://www.facebook.com/104124393281645"
    end
  end

end
