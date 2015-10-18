class FacebookShareJob < ActiveJob::Base
  include Rollbar::ActiveJob
  queue_as :shares

  def perform(share)
    FacebookSharer.new(share).post
  end

end
