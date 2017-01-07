require "spec_helper"

feature "user views list of meetups" do
  # As a user...
  # I want to view a list of all available meetups
  # So that I can get together with people with similar interests

  # Acceptance Criteria:
  # * On the meetups index page, I should see the name of each meetup.
  # * Meetups should be listed alphabetically.

  pending "successfully view alphabetized list of meetups" do
    tap_dance = Meetup.create!({
      name: "Tap Dance Recital",
      description: "Tango Cafe's annual Tap Dance Recital will be (date), (time), (tickets).",
      location: "Tango Cafe",
      creator: "me"
      })
    theatre = Meetup.create!({
      name: "RBTO Amature Auditions",
      description: 'Rochester Broadway Theatre Organization is holding auditions for the spring show, "Rent".',
      location: "Auditorium Theatre",
      creator: "you"
      })

    visit "/meetups"

    expect(page).to have_content("RBTO Amature Auditions")
    expect(page).to have_content("Tap Dance Recital")
    # Test for alphabetical order????????????????????
  end
end
