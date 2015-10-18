class FacebookActionTaker
  include FacebookGraphable

  def initialize(facebook_account, share_uid)
    @object = facebook_account
    @share_uid = share_uid
  end

  def like
    graph.put_like(@share_uid)
  end

  def unlike
    graph.delete_like(@share_uid)
  end

  def comment(text)
    graph.put_comment(@share_uid, text)
  end

  def reshare(text=nil, link=nil)
    link ||= get_link
    if text
      graph.put_connections(@object.uid, "feed", message: text, link: link)
    else
      graph.put_connections(@object.uid, "feed", link: link)
    end
  end

  private

  def get_link
    graph.get_object(@share_uid, fields: "link")["link"]
  end

end
