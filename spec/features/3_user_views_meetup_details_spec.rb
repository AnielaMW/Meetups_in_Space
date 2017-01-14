require "spec_helper"

feature "user views details of a meetup" do
  # As a user...
  # I want to view the details of a meetup
  # So that I can learn more about its purpose

  # Acceptance Criteria:
  # * On the index page, the name of each meetup should be a link to the meetup's show page.
  # * On the show page, I should see the name, description,  location, and the creator of the meetup.

  scenario "successfully view details of a meetup" do
    meetup = FactoryGirl.create(:meetup)

    visit "/meetups"
    click_link "#{meetup.name}"

    expect(page).to have_current_path("/meetups/#{meetup.id}")
    expect(page).to have_content(meetup.name)
    expect(page).to have_content(meetup.location)
    expect(page).to have_content(meetup.description)
    expect(page).to have_content(meetup.user.username)
  end
end
