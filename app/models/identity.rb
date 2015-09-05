class Identity < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_one :twitter_account, dependent: :destroy
  has_one :facebook_account, dependent: :destroy
  has_one :instagram_account, dependent: :destroy
  has_one :linkedin_account, dependent: :destroy

  validates :user, presence: true, uniqueness: true
  validates :uid, presence: true, uniqueness: true
  validates :provider, presence: true

  acts_as_paranoid

  scope :facebook, -> { where(provider: "facebook") }
  scope :twitter, -> { where(provider: "twitter") }
  scope :instagram, -> { where(provider: "instagram") }
  scope :linkedin, -> { where(provider: "linkedin") }

  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider)
  end

  def check_for_account(auth)
    case provider
    when "facebook"
      account = FacebookAccount.find_or_create_by(
        token: auth.credentials.token,
        uid: uid,
        identity: self
      )
      account.create_facebook_pages
    when "twitter"
      account = TwitterAccount.find_or_create_by(
        token: auth.credentials.token,
        secret: auth.credentials.secret,
        handle: "@#{auth.info.nickname}",
        uid: uid,
        identity: self
      )
      when "instagram"
        account = InstagramAccount.find_or_create_by(
          token: auth.credentials.token,
          uid: uid,
          identity: self
        )
    end
  end

end
