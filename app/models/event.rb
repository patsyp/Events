class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users_attending, through: :attendees, source: :user
  validates :name, :date, :location, :state, presence: true
  validate :validate_date
  def validate_date
  	if date < Date.today
  		errors.add(:date, "can't be in the past.")
  	end
  end
end
