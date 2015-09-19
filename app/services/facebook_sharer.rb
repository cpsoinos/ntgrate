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
    get_share_url
  end

  def delete
    if graph.delete_object(@share.share_id)
      @share.destroy
    end
  end

  def get_share_url
    share_id_parts = @share.share_id.split("_")
    url = "https://www.facebook.com/#{share_id_parts.first}/posts/#{share_id_parts.last}"
    @share.update_attribute("share_url", url)
  end

end
