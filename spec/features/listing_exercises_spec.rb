require "rails_helper"
RSpec.feature "Listing Exercises" do
  before do
    @bhagath = User.create!(email: "bhgath@gmail.com", password: "password")
	login_as(@bhagath)
	@e1 = @bhagath.exercises.create(duration_in_min: 20, workout: "Body building routine", workout_date: "2015-08-02")
	@e2 = @bhagath.exercises.create(duration_in_min: 30, workout: "Body building routine", workout_date: "2015-04-03")
  end

  scenario "show user's workout for last 7 day's" do
  	visit "/"
  	click_link "My Lounge"
  	expect(page).to have_content(@e1.duration_in_min)
  	expect(page).to have_content(@e1.workout)
  	expect(page).to have_content(@e1.workout_date)
  	expect(page).to have_content(@e2.duration_in_min)
  	expect(page).to have_content(@e2.workout)
  	expect(page).to have_content(@e2.workout_date)
  end
end