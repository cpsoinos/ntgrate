class FacebookPage < ActiveRecord::Base
  belongs_to :facebook_account
  has_many :facebook_shares

  validates :name, presence: true
  validates :token, presence: true
  validates :uid, presence: true, uniqueness: true
  validates :facebook_account, presence: true
  validates :page_url, presence: true

  before_save :get_picture

  include FacebookGraphable

  acts_as_paranoid

  def feed
    @_feed ||= FacebookFeedRetriever.new(self).get_feed
  end

  private

  def graph
    Koala::Facebook::API.new(token, ENV["FACEBOOK_APP_SECRET"])
  end

  def get_picture
    self.picture = graph.get_picture(uid)
  end

end
