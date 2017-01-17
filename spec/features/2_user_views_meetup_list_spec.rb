require "spec_helper"

feature "User views list of meetups" do
  # As a user...
  # I want to view a list of all available meetups
  # So that I can get together with people with similar interests

  # Acceptance Criteria:
  # * On the meetups index page, I should see the name of each meetup.
  # * Meetups should be listed alphabetically.

  scenario "successfully view alphabetized list of meetups" do
    meetup1 = FactoryGirl.create(:meetup)
    meetup2 = FactoryGirl.create(:meetup1)

    visit "/meetups"

    meetups = page.all("div#meetuplist ul li")
    expect(meetups[0]).to have_content(meetup2.name)
    expect(meetups[1]).to have_content(meetup1.name)
    # still need to test for order ???????????
  end
end
