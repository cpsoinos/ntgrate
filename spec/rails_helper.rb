ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'webmock/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!
OmniAuth.config.test_mode = true
Capybara.javascript_driver = :poltergeist
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.before(:each) do
    stub_request(:get, /api.github.com/).
      with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: "stubbed response", headers: {})
  end

  # Fast login for tests that specify 'login: true'
  # config.before(:each, login: true) do
  #   @user = FactoryGirl.create(:user)
  #   login_as(@user, scope: :user)
  # end
end
