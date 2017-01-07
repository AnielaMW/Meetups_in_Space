require "spec_helper"

feature "user creates a meetup" do
  # As a user
  # I want to create a meetup
  # So that I can gather a group of people to do an activity

  # Acceptance Criteria:
  # * There should be a link from the meetups index page that takes you to the meetups new page. On this page there is a form to create a new meetup.
  # * I must be signed in, and I must supply a name, location, and description.
  # * If the form submission is successful, I should be brought to the meetup's show page, and I should see a message that lets me know that I have created a meetup successfully.
  # * If the form submission is unsuccessful, I should remain on the meetups new page, and I should see error messages explaining why the form submission was unsuccessful. The form should be pre-filled with the values that were provided when the form was submitted.

  pending "successfully create a meetup"
  pending "fail to create meetup if not signed in"
  pending "fail to create meetup if invalid information"
end
