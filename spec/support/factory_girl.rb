require 'factory_girl'

FactoryGirl.define do
  factory :user do
    provider "github"
    sequence(:uid) { |n| n }
    sequence(:username) { |n| "jarlax#{n}" }
    sequence(:email) { |n| "jarlax#{n}@launchacademy.com" }
    avatar_url "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
  end

  factory :meetup do
    name "Tap Dance Recital"
    description "Tango Cafe's annual Tap Dance Recital will be (date), (time), (tickets)."
    location "Tango Cafe"
    user

    factory :meetup1 do
      name "RBTO Amature Auditions"
      description 'Rochester Broadway Theatre Organization is holding auditions for the spring show, "Rent".'
      location "Auditorium Theatre"
    end
  end

end
