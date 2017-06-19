class User < ActiveRecord::Base
  has_secure_password
  has_many :events, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :events_joined, through: :attendees, source: :event
  validates :first_name, :last_name, :email, :location, :state, presence: true
end
