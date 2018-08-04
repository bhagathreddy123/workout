require "rails_helper"

RSpec.feature "Creating Exercise" do
  before do
   @bhagath = User.create!(email: "bhagath@example.com", password: "password")
   login_as(@bhagath)
  end	
  scenario "with valid credentials" do
  	visit "/"
    
    click_link "My Lounge"
  	click_link "New Workout"
  	expect(page).to have_link("Back")
  	fill_in "Duration", with: 70
  	fill_in "Workout Details", with: "weight lifting"
  	fill_in "Activity Date" "2015-08-07"
  	click_link "Create Exercise"
  	expect(page).to have_content("Exercise has been created")
  	exercise = Exercise.last
  	expect(page.current_path).to eq(user_exercise_path(@bhagath, exercise))
   end
scenario "with invalid inputs" do
  visit "/"
  click_link "My Lounge" 
  click_link "New workout"
  expect(page).to have_link("Back")
  fill_in "Duration", with: nil
  fill_in "Workout Details", with: ""
  fill_in "Activity Date", with: ""
  click_button "Create Exercise"
  expect(page).to have_content("Exercise has been created")

  expect(page).to have_content("Duration in min can't be blank")
  expect(page).to have_content("Duration in min not a number")
  expect(page).to have_content("workout can't be blank")
end

end
