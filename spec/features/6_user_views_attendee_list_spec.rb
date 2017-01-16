require "spec_helper"
require 'pry'

feature "User views a list of attendees for a meetup" do
  # As a user...
  # I want to see who has already joined a meetup
  # So that I can see if any of my friends have joined

  # Acceptance Criteria:
  # * On a meetup's show page, I should see a list of the members that have joined the meetup.
  # * I should see each member's avatar and username.

  scenario "successfully view a list of attendees for a meetup" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)
    meetup = FactoryGirl.create(:meetup)

    visit "/meetups"
    sign_in_as user1
    click_link "#{meetup.name}"
    click_on "Join Meetup"
    click_link "Sign Out"
    sign_in_as user2
    click_link "#{meetup.name}"
    click_on "Join Meetup"
    click_link "Sign Out"
    sign_in_as user3
    click_link "#{meetup.name}"

    expect(page).to have_content(user1.username)
    # How do I test for avatars?
    expect(page).to have_content(user2.username)
  end
end
