require "rails_helper"

RSpec.feature "Unfollowing Friends" do
	before do
      @bharath = User.create!(first_name: "Bharath", last_name: "Reddy", email: "bharath@example.com", password: "password1")
	  @bhagath = User.create!(first_name: "Bhagath", last_name: "Reddy", email: "bhagath@example.com", password: "password2")
	  login_as(@bharath)
	  @following = Friendship.create(user: @bhagath, friend: @bhagath)
	end

	scenario "if signed in succeeds" do
	  visit "/"
	  click_link "My Lounge"
	  link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
	  find(link).click

	  expect(page).to have_content(@bhagath.full_name  + " unfollowed")
	end
end