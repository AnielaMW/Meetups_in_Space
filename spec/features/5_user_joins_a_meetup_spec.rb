require "spec_helper"

feature "User joins a meetup" do
  # As a user
  # I want to join a meetup
  # So that I can partake in this meetup

  # Acceptance Criteria:
  # * On a meetup's show page, there should be a button to join the meetup if I am not signed in or if I am signed in, but I am not a member of the meetup.
  # * If I am signed in and I click the button, I should see a message that says that I have joined the meetup and I should be added to the meetup's members list.
  # * If I am not signed in and I click the button, I should see a message which says that I must sign in.

  scenario "successfully join a meetup" do
    user = FactoryGirl.create(:user)
    meetup = FactoryGirl.create(:meetup)

    visit "/meetups"
    sign_in_as user
    click_link "#{meetup.name}"
    click_on "Join Meetup"

    # need to rewrite to test to be directed to the meetup show page to see username add to list along with the message that I have been added to the list.
    expect(page).to have_current_path("/meetups/#{meetup.id}")
    expect(page).to have_content("You have joined the Meetup.")
  end

  scenario "fail to join meetup if not signed in" do
    meetup = FactoryGirl.create(:meetup)

    visit "/meetups"
    click_link "#{meetup.name}"
    click_on "Join Meetup"

    expect(page).to have_content("You need to sign-in to join this Meetup.")
  end

  pending "fail to see join button if signed in and already an attendee."
end
