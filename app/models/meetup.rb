class Meetup < ActiveRecord::Base
  has_many :users, through: :attendees
  belongs_to :user
end
