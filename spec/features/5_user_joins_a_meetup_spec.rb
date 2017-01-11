require "spec_helper"

feature "user joins a meetup" do
  # As a user
  # I want to join a meetup
  # So that I can partake in this meetup

  # Acceptance Criteria:
  # * On a meetup's show page, there should be a button to join the meetup if I am not signed in or if I am signed in, but I am not a member of the meetup.
  # * If I am signed in and I click the button, I should see a message that says that I have joined the meetup and I should be added to the meetup's members list.
  # * If I am not signed in and I click the button, I should see a message which says that I must sign in.

  scenario "successfully join a meetup" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:meetup)
    FactoryGirl.create(:meetup1)

    visit "/meetups"
    click_link "Tap Dance Recital"
    click_link "Join Meetup"

    expect(page).to have_content("Tap Dance Recital")
    expect(page).to have_content("You have joined this Meetup.")
  end

  pending "fail to join meetup if not signed in" do
    FactoryGirl.create(:meetup)
    FactoryGirl.create(:meetup1)

    visit "/meetups"
    click_link "Tap Dance Recital"
    click_link "Join Meetup"

    expect(page).to have_content("You need to sign-in to join a new Meetup.")
  end
end
