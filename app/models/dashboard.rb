class Dashboard < ActiveRecord::Base
  belongs_to :user, dependent: :destroy

  validates :user, presence: true, uniqueness: true
end
