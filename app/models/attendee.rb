class Attendee < ActiveRecord::Base
  has_many :users
  has_many :meetups
end
