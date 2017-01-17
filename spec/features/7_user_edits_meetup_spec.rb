require "spec_helper"

feature "Creator edits details for a meetup" do
  # As a meetup creator...
  # I want to change my meetup's details
  # So the meetup has up-to-date details

  # Acceptance Criteria:
  # * If I am signed in and I created the meetup, there should be a link from the meetup's show page that takes you to the meetup's edit page. On this page there is a form to edit the meetup, and it is pre-filled with the meetup's details.
  # * I must be signed and the meetup's creator, and I must supply a name, location, and description.
  # * If the form submission is successful, I should be brought to the meetup's show page, and I should see a message that lets me know that the meetup has been successfully updated.
  # * If the form submission is unsuccessful, I should remain on the meetup's edit page, and I should see error messages explaining why the form submission was unsuccessful. The form should be pre-filled with the values that were provided when the form was submitted.

  pending "successfully edit details for a meetup"
  pending "fail to see meetup edit button if not signed in"
  pending "fail to see meetup edit button if not creator"
  pending "fail to edit meetup if invalid information"
end
