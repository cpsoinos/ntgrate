class InstagramAccount < ActiveRecord::Base
  belongs_to :identity

  validates :token, presence: true
  validates :uid, presence: true, uniqueness: true
  validates :identity, presence: true

  acts_as_paranoid
  
end
