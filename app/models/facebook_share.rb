class FacebookShare < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  mount_uploader :video, VideoUploader
  belongs_to :facebook_page

  include Shareable
  # include FacebookGraphable

  validates :facebook_page, presence: true
  validate :photo_size_validation
  validate :video_size_validation

  acts_as_paranoid

  def share
    get_share_type
    FacebookShareJob.perform_later(self)
  end

  def delete_share
    FacebookShareDeleteJob.perform_later(self)
  end

  private

  def photo_size_validation
    errors[:photo] << "should be less than 5MB" if photo.size > 5.megabytes
  end

  def video_size_validation
    errors[:video] << "should be less than 500MB" if video.size > 500.megabytes
  end

end
