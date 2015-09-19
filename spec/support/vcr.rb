VCR.configure do |c|
  c.cassette_library_dir = Rails.root.join("spec", "vcr")
  c.hook_into :webmock
  c.ignore_localhost = true

  c.filter_sensitive_data('<FACEBOOK_APP_ID>') { ENV["FACEBOOK_APP_ID"] }
  c.filter_sensitive_data('<FACEBOOK_APP_SECRET>') { ENV["FACEBOOK_APP_SECRET"] }
  c.filter_sensitive_data('<TWITTER_CONSUMER_KEY>') { ENV["TWITTER_CONSUMER_KEY"] }
  c.filter_sensitive_data('<TWITTER_SECRET>') { ENV["TWITTER_SECRET"] }
  c.filter_sensitive_data('<INSTAGRAM_CLIENT_ID>') { ENV["INSTAGRAM_CLIENT_ID"] }
  c.filter_sensitive_data('<INSTAGRAM_CLIENT_SECRET>') { ENV["INSTAGRAM_CLIENT_SECRET"] }
  c.filter_sensitive_data('<SMTP_ADDRESS>') { ENV["SMTP_ADDRESS"] }
  c.filter_sensitive_data('<SMTP_DOMAIN>') { ENV["SMTP_DOMAIN"] }
  c.filter_sensitive_data('<SMTP_PASSWORD>') { ENV["SMTP_PASSWORD"] }
  c.filter_sensitive_data('<SMTP_USERNAME>') { ENV["SMTP_USERNAME"] }
  c.filter_sensitive_data('<MANDRILL_TEST_API_KEY>') { ENV["MANDRILL_TEST_API_KEY"] }
end

RSpec.configure do |c|
  c.around(:each, :vcr) do |example|
    name = example.metadata[:full_description].split(/\s+/, 2).join("/").underscore.gsub(/[^\w\/]+/, "_")
    options = example.metadata.slice(:record, :match_requests_on).except(:example_group)
    VCR.use_cassette(name, options) { example.call }
  end
end
