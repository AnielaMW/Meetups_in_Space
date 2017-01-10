require "spec_helper"

feature "user views list of meetups" do
  # As a user...
  # I want to view a list of all available meetups
  # So that I can get together with people with similar interests

  # Acceptance Criteria:
  # * On the meetups index page, I should see the name of each meetup.
  # * Meetups should be listed alphabetically.

  scenario "successfully view alphabetized list of meetups" do
    FactoryGirl.create(:meetup)
    FactoryGirl.create(:meetup1)

    visit "/meetups"

    expect(page).to have_content("RBTO Amature Auditions")
    expect(page).to have_content("Tap Dance Recital")
    # still need to test for order ???????????????????????
  end
end
