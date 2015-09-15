class FacebookShareDeleteJob < ActiveJob::Base
  queue_as :shares

  def perform(share)
    FacebookSharer.new(share).delete
  end

end
