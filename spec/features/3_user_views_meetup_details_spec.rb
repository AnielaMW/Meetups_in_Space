require "spec_helper"

feature "user views details of a meetup" do
  # As a user...
  # I want to view the details of a meetup
  # So that I can learn more about its purpose

  # Acceptance Criteria:
  # * On the index page, the name of each meetup should be a link to the meetup's show page.
  # * On the show page, I should see the name, description,  location, and the creator of the meetup.

  scenario "successfully view details of a meetup" do
    FactoryGirl.create(:meetup)
    FactoryGirl.create(:meetup1)

    visit "/meetups"
    click_link "Tap Dance Recital"

    expect(page).not_to have_content("RBTO Amature Auditions")
    expect(page).to have_content("Tap Dance Recital")
    expect(page).to have_content("Tango Cafe")
  end
end
