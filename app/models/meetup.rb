class Meetup < ActiveRecord::Base
  has_many :users, through: :attendees
  belongs_to :user

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true, length: {maximum: 2500}
end
