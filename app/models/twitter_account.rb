class TwitterAccount < ActiveRecord::Base
  belongs_to :identity
  has_many :twitter_shares

  include TwitterAccountable

  validates :token, presence: true
  validates :uid, presence: true, uniqueness: true
  validates :secret, presence: true
  validates :identity, presence: true

  acts_as_paranoid

  def follow(handle)
    client.follow(handle)
  end

  def fetch_user(user)
    client.user(user)
  end

  def followers
    client.followers
  end

  def find_followers(user)
    client.followers(user)
  end

  def friends
    client.friends
  end

  def find_friends(user)
    client.friends(user)
  end

  def timeline
    client.home_timeline
  end

  def find_timeline(user)
    client.user_timeline(user)
  end

  def mentions
    client.mentions_timeline
  end

  def fetch_tweet(share_id)
    client.status(share_id)
  end

  def tweets
    client.statuses(twitter_shares.pluck(:share_id))
  end

end
