class Mixfeed < ActiveRecord::Base
  belongs_to :user, dependent: :destroy

  validates :user, presence: true, uniqueness: true

  acts_as_paranoid

end
