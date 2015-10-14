class TwitterShareJob < ActiveJob::Base
  include Rollbar::ActiveJob
  queue_as :shares

  def perform(share)
    TwitterSharer.new(share).post
  end

end
