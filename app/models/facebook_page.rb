class FacebookPage < ActiveRecord::Base
  belongs_to :facebook_account
  has_many :facebook_shares

  validates :name, presence: true
  validates :token, presence: true
  validates :uid, presence: true, uniqueness: true
  validates :facebook_account, presence: true

  acts_as_paranoid

end
