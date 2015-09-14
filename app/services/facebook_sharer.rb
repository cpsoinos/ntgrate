class FacebookSharer
  include FacebookGraphable

  def initialize(share)
    @share = share
    @facebook_page = share.facebook_page
  end

  def post
    case @share.share_type
    when "text"
      response = graph.put_wall_post(@share.content)
    when "link"
      response = graph.put_connections(@facebook_page.uid, 'feed', :message => @share.content, :link => @share.link)
    when "photo"
      response = graph.put_picture(@share.photo.current_path, {message: @share.content})
    when "video"
      response = graph.put_video(@share.video.current_path, {message: @share.content})
    end
    @share.update_attribute("share_id", response["id"])
  end

  def delete
    if graph.delete_object(@share.id)
      self.destroy
    end
  end

  # def get_share_url
  #   graph.get_object(@share.share_id)
  # end

end
