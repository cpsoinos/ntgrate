class FacebookShare < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  mount_uploader :video, VideoUploader
  belongs_to :facebook_page

  include Shareable

  validates :facebook_page, presence: true
  validate :photo_size_validation
  validate :video_size_validation

  acts_as_paranoid

  def share
    get_share_type
    case share_type
    when "text"
      response = graph.put_wall_post(content)
    when "link"
      response = graph.put_connections(facebook_page.uid, 'feed', :message => content, :link => link)
    when "photo"
      response = graph.put_picture(photo.current_path, {message: content})
    when "video"
      response = graph.put_video(video.current_path, {message: content})
    end
    update_attribute("share_id", response["id"])
  end

  def delete_share
    graph.delete_object(share_id)
    self.destroy
  end

  private

  def graph
    Koala::Facebook::API.new(facebook_page.token, ENV["FACEBOOK_APP_SECRET"])
  end

  def photo_size_validation
    errors[:photo] << "should be less than 5MB" if photo.size > 5.megabytes
  end

  def video_size_validation
    errors[:video] << "should be less than 500MB" if video.size > 500.megabytes
  end

end
