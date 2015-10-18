class TwitterAccount < ActiveRecord::Base
  belongs_to :identity
  has_many :twitter_shares

  include TwitterAccountable

  validates :token, presence: true
  validates :uid, presence: true, uniqueness: true
  validates :secret, presence: true
  validates :identity, presence: true
  validates :account_url, presence: true

  acts_as_paranoid

  def tweets
    client.statuses(twitter_shares.pluck(:share_id))
  end

end
