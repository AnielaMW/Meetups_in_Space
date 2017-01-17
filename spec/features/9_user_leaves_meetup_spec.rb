require "spec_helper"

feature "User leaves a meetup" do
  # As a meetup creator...
  # I want to cancel my meetup
  # So that I'm no longer listed as a member of the meetup

  # Acceptance Criteria:
  # * If I am signed in and I created the meetup, there should be a delete button on the meetup's show page.
  # * If I click on the delete button, the meetup should be deleted and I should be redirected to the meetups index page. Also, all of the meetup's memberships should be deleted as well.

  # As a meetup member
  # I want to leave a meetup

  # Acceptance Criteria:
  # * On a meetup's show page, there should be a button to leave the meetup if I am signed in and I am a member of the meetup.
  # * If I click the button, I should see a message that says that I have left the meetup and I should be removed from the meetup's members list.

  pending "successfully leave a meetup"
  pending "fail to see meetup leave button if not signed in"
  pending "fail to see meetup leave button if not attendee"
end
