class FacebookAccount < ActiveRecord::Base
  belongs_to :identity

  validates_presence_of :token, :uid
  validates_uniqueness_of :uid
end
