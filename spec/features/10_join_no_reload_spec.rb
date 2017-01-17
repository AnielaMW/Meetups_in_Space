require "spec_helper"

feature "User joins a meetup without a page reload" do
  # As a user...
  # I want to join a meetup without a page reload
  # So that I can have a seamless experience when joining a meetup

  # Acceptance Criteria:
  # * If I click the join meetup button, I will join the meetup without refreshing the page. I should see the join meetup up button become the leave meetup button, I should be added to the meetup's members list, and I should NOT see a message saying that I've successfully joined a meetup.
  # * If a user disables javascript, the join meetup functionality should still work with a page relaod (hint: create new route that your AJAX request utilizes rather than rewriting the original route).

  pending "successfully join a meetup without a page reload"
  pending "successfully join a meetup even if javascript disabled"
end
