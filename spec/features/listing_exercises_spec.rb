require "rails_helper"
RSpec.feature "Listing Exercises" do
  before do
    @bhagath = User.create!(first_name: "bhagath", last_name: "reddy",email: "bhgath@gmail.com", password: "password")
    @bharath = User.create!(first_name: "bharath", last_name: "reddy",email: "bharath@gmail.com", password: "password")
	  login_as(@bhagath)
	  @e1 = @bhagath.exercises.create(duration_in_min: 20, workout: "Body building routine", workout_date: "2015-08-02")
	  @e2 = @bhagath.exercises.create(duration_in_min: 30, workout: "Body building routine", workout_date: "2015-04-03")
    @following = Friendship.create(user: @bhagath, friend: @bharath)
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

  scenario "shows a list of users friends" do
    visit "/" 
    click_link "My Lounge"
    expect(page).to have_content("My Friends")
    expect(page).to have_link(@bharath.full_name)
    expect(page).to have_link("Unfollow")
  end
end