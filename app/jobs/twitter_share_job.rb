class TwitterShareJob < ActiveJob::Base
  queue_as :shares

  def perform(share)
    TwitterSharer.new(share).post
  end

end
