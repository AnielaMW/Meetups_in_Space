require "spec_helper"

feature "User submits meetup comments" do
  # As a meetup member...
  # I want to leave comments on a meetup
  # So that I can communicate with other members of the group about the meetup

  # Acceptance Criteria:
  # * On the meetup's show page, if I am not signed, then there should be some text that tells me to login in order to comment.
  # * On the meetup's show page, if I am signed in, there should be a form to create a comment on the meetup.
  # * I must supply a body for the comment, and I must be a member of the group.
  # * If the form submission is successful, I should be brought to the meetup's show page, and I should see a message that lets me know that the comment has been successfully created and the comment added to the list of comments.
  # * If the form submission is unsuccessful, I should be brought to the meetup's show page, and I should see error messages explaining why the form submission was unsuccessful. The form should be pre-filled with the values that were provided when the form was submitted.

  pending "successfully submits meetup comments"
  pending "fail to submit comment if not signed in"
  pending "fail to submit comment if invalid information"
end
