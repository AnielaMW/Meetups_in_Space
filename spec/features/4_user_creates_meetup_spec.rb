require "spec_helper"

feature "User creates a meetup" do
  # As a user
  # I want to create a meetup
  # So that I can gather a group of people to do an activity

  # Acceptance Criteria:
  # * There should be a link from the meetups index page that takes you to the meetups new page. On this page there is a form to create a new meetup.
  # * I must be signed in, and I must supply a name, location, and description.
  # * If the form submission is successful, I should be brought to the meetup's show page, and I should see a message that lets me know that I have created a meetup successfully.
  # * If the form submission is unsuccessful, I should remain on the meetups new page, and I should see error messages explaining why the form submission was unsuccessful. The form should be pre-filled with the values that were provided when the form was submitted.

  scenario "successfully create a meetup" do
    user = FactoryGirl.create(:user)
    meetup = {name: "Mac's Tavern Darts Tourny", location: "Mac's Tavern", description: "Mac's Tavern weekly Darts tournement, (day), (time). Half price drinks until 6pm."}

    visit "/meetups"
    sign_in_as user
    click_link "Create New Meetup"

    fill_in "Name", :with => "#{meetup[:name]}"
    fill_in "Location", :with => "#{meetup[:location]}"
    fill_in "Description", :with => "#{meetup[:description]}"
    click_on 'Create Meetup'

    expect(page).not_to have_current_path("/meetups")
    expect(page).to have_current_path("/meetups/4")
    expect(page).to have_content(meetup[:name])
    expect(page).to have_content(meetup[:location])
    expect(page).to have_content(meetup[:description])
    expect(page).to have_content(user.username)
  end

  scenario "fail to create meetup if not signed in" do
    visit "/meetups"
    click_link "Create New Meetup"

    expect(page).to have_content("You need to sign-in to create a new Meetup.")
  end

  scenario "fail to create meetup if invalid information" do
    user = FactoryGirl.create(:user)
    meetup = {name: "", location: "", description: "They say you are made of clouds, they say you are made of feathers, they say you are everywhere or nowhere—we know you are both. Our flight is delayed, this airport another nowhere. If this is your final destination, the air murmurs, if a stranger or anyone you do not know well offers you anything ... but how well & what's he offering & is this our final destination? At the hotel a man hands us the key to room three one three—home for a week or so. On the lobby tv a woman once apparently enormous holds her old jeans up to her body & smiles. Neil Diamond sings & when I go in- to the bathroom he follows. Everybody has one. Paradise is cloudless, they say, impossible to know. Yesterday a man was sucked into the earth as he slept—a sinkhole opened below his bed—not even his brother could save him. In the hotel restaurant my daughter orders corn flakes, they come with a pitcher of milk, she pours nearly all of it into her bowl, until I stop her she will keep on pouring. Three more tvs are screwed into the wall above us—a car goes round & round, a pitcher throws a baseball, a woman slams her racket to the clay. My daughter pushes her bowl away, picks two packets of jelly from the basket, pulls the plastic off one, then the other, lifts each to her tongue—red, then purple. The wallpaper is the texture of trees, a landscape seen from above, a contour map of an unnamed mountain, people wandering the face of it. If we were closer we could tell river from leaf, mountain from shadow, a fire making, unmaking itself. What is this strand of DNA between us, unconnected to & of the shadows parading past, our outlines already chalked into the earth? I live on air & light, I drag my daughter everywhere, this morning she muttered Federer Federer Federer like a spell & it was as if he stood before us again, his perfect red jersey. How many mornings, the sun not yet up, did I swivel on the red stool at the supermarket lunch counter, my mother in back extruding donuts, the aisles dark & empty behind us—she'd bundled me into the car still sleeping to get there. I'd twirl or wander or make toast, contemplating the basket of butter & jelly, each in its little wasteful tub, impervious to air or time or decay. Angel of Grape, your purple body not only filled those coffins but took the shape of those coffins—emptiness made whole, color now a shape. Angel, my daughter now wants only you, she asks for the whole basket, she pulls back each sheet, puts her tongue in— strawberry is her favorite, because it tastes like strawberry."}

    visit "/meetups"
    sign_in_as user
    click_link "Create New Meetup"

    fill_in "Name", :with => "#{meetup[:name]}"
    fill_in "Location", :with => "#{meetup[:location]}"
    fill_in "Description", :with => "#{meetup[:description]}"
    click_on 'Create Meetup'

    expect(page).to have_current_path("/meetups/create_new")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Location can't be blank")
    expect(page).to have_content("Description is too long (maximum is 2500 characters)")
  end
end
