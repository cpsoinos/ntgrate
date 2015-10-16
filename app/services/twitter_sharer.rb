class TwitterSharer
  include TwitterAccountable

  def initialize(share)
    @share = share
    @twitter_account = @share.twitter_account
  end

  def post
    case @share.share_type
    when "text"
      response = client.update(@share.content)
    when "photo"
      response = client.update_with_media(@share.content, photo_file)
    # when "video"
    #   response = client.update_with_media(@share.content, video_file)
    end
    @share.update_attribute("share_id", response.id)
  end

  def photo_file
    open(@share.photo.file.url)
  end

  # def video_file
  #   open(@share.video.file.url)
  # end

end
