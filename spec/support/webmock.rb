# require 'webmock/rspec'
#
# WebMock.disable_net_connect!(allow_localhost: true)
#
# RSpec.configure do |config|
#
#   config.before(:each) do
#     stub_request(:get, /api.github.com/).
#       with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
#       to_return(status: 200, body: "stubbed response", headers: {})
#
#     stub_request(:post, "https://graph.facebook.com/oauth/access_token").
#       with(
#         :body => {
#           "client_id"=>ENV["FACEBOOK_APP_ID"],
#           "client_secret"=>ENV["FACEBOOK_APP_SECRET"],
#           "grant_type"=>"client_credentials"
#         },
#         :headers => {
#           'Accept'=>'*/*',
#           'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
#           'Content-Type'=>'application/x-www-form-urlencoded',
#           'User-Agent'=>'Faraday v0.9.1'
#         }
#       ).to_return(:status => 200, :body => "", :headers => {})
#
#     stub_request(:get, "http://graph.facebook.com/#{ENV['FACEBOOK_APP_ID']}/accounts/test-users").
#       with(
#         :headers => {
#           'Accept'=>'*/*',
#           'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
#           'User-Agent'=>'Faraday v0.9.1'
#         }
#       ).to_return(:status => 200, :body => "", :headers => {})
#
#   end
#
# end
