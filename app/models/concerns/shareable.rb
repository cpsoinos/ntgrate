module Shareable
  extend ActiveSupport::Concern

  def get_share_type
    if link.present?
      update_attribute("share_type", "link")
    elsif photo.present?
      update_attribute("share_type", "photo")
    elsif video.present?
      update_attribute("share_type", "video")
    else
      update_attribute("share_type", "text")
    end
  end

end
