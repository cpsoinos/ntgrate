class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :dashboard

  validates :email, presence: true, uniqueness: true
  # validates :dashboard, presence: true, uniqueness: true
end
