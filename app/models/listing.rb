class Listing < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :status, presence: true

  scope :active, -> { where(status: "active") }
  scope :inactive, -> { where(status: "inactive") }
  scope :sold, -> { where(status: "sold") }
end
