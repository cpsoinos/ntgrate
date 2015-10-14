class FacebookShareDeleteJob < ActiveJob::Base
  include Rollbar::ActiveJob
  queue_as :shares

  def perform(share)
    FacebookSharer.new(share).delete
  end

end
