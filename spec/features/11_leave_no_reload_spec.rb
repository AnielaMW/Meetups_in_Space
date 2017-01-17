require "spec_helper"

feature "User leaves a meetup without a page reload" do
  # As a user...
  # I want to leave a meetup without a page reload
  # So that I can have a seamless experience when leaving a meetup

  # Acceptance Criteria:
  # * If I click the leave meetup button, I will leave the meetup without refreshing the page. I should see the leave meetup up button become the join meetup button, I should be removed from the meetup's members list, and I should NOT see a message saying that I've successfully left the meetup.
  # * If a user disables javascript, the leave meetup functionality should still work with a page relaod (hint: create new route that your AJAX request utilizes rather than rewriting the original route).

  pending "successfully leave a meetup without a page reload"
  pending "successfully leave a meetup even if javascript disabled"
end
