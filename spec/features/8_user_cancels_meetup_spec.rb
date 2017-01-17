require "spec_helper"

feature "Creator cancels a meetup" do
  # As a meetup creator...
  # I want to cancel my meetup
  # So nobody comes to a meetup that is not taking place

  # Acceptance Criteria:
  # * If I am signed in and I created the meetup, there should be a delete button on the meetup's show page.
  # * If I click on the delete button, the meetup should be deleted and I should be redirected to the meetups index page. Also, all of the meetup's memberships should be deleted as well.

  pending "successfully cancel a meetup"
  pending "fail to see meetup cancel button if not signed in"
  pending "fail to see meetup cancel button if not creator"
end
