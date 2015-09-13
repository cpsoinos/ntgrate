class TwitterShare < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  mount_uploader :video, VideoUploader
  belongs_to :twitter_account

  include TwitterAccountable
  include Shareable

  validates :twitter_account, presence: true

  acts_as_paranoid

  def share
    get_share_type
    TwitterShareJob.perform_later(self)
  end

  def delete_share
    client.destroy_status(share_id)
  end

  def retweeters
    client.retweeters_of(share_id)
  end

end
