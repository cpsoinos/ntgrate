class Identity < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_one :twitter_account, dependent: :destroy
  has_one :facebook_account, dependent: :destroy

  validates_presence_of :user, :uid, :provider
  validates_uniqueness_of :uid, scope: :provider

  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider)
  end

  def check_for_account(auth)
    case provider
    when "facebook"
      FacebookAccount.find_or_create_by(
        token: auth.credentials.token,
        uid: uid,
        identity: self
      )
    when "twitter"
      TwitterAccount.find_or_create_by(
        token: auth.credentials.token,
        secret: auth.credentials.secret,
        handle: "@#{auth.info.nickname}",
        uid: uid,
        identity: self
      )
    end
  end

end
