class TwitterAccount < ActiveRecord::Base
  belongs_to :identity

  validates_presence_of :token, :uid, :secret
  validates_uniqueness_of :uid
end
