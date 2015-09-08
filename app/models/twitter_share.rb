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
    case share_type
    when "text"
      response = client.update(content)
    when "photo"
      response = client.update_with_media(content, photo_file)
    # when "video"
    #   client.update_with_media(content, video_file)
    end
    update_attribute("share_id", response["id"])
  end

  def delete_share
    client.destroy_status(share_id)
  end

  def retweet
    client.retweet(share_id)
  end

  def retweeters
    client.retweeters_of(share_id)
  end

  def photo_file
    open(photo.file.file)
  end

  def video_file
    open(video.file.file)
  end

end
