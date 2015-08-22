class Identity < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  validates_presence_of :user, :uid, :provider, :token
  validates_uniqueness_of :uid, scope: :provider

  def self.find_for_oauth(auth)
    identity = find_or_create_by(uid: auth.uid, provider: auth.provider)
    if identity.token != auth.credentials.token
      identity.update_attribute("token", auth.credentials.token)
    end
    identity
  end
end
