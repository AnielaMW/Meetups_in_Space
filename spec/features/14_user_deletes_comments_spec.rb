require "spec_helper"

feature "Comment Creator deletes meetup comments" do
  # As a comment creator...
  # I want to erase a comment
  # So that I remove any comments that no longer apply

  # Acceptance Criteria:
  # * On the meetup's show page, if I am the creator of the comment, I should see a delete button next to it.
  # * When I click on the button, the comment should be deleted and I should see a message telling me that the comment was successfully deleted.

  pending "successfully delete meetup comments"
  pending "fail to see delete comment button if not signed in"
  pending "fail to see delete comment button if not comment creator"
end
