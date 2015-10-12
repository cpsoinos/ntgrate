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

end
