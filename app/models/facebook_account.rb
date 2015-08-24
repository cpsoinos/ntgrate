class FacebookAccount < ActiveRecord::Base
  belongs_to :identity

  validates_presence_of :token, :uid, :identity
  validates_uniqueness_of :uid
end
