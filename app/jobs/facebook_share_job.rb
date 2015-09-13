class FacebookShareJob < ActiveJob::Base
  queue_as :shares

  def perform(share)
    FacebookSharer.new(share).post
  end

end
