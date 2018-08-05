require "rails_helper"

RSpec.feature "Following Friends" do
	before do
      @bharath = User.create!(first_name: "Bharath", last_name: "Reddy", email: "bharath@example.com", password: "password1")
	  @bhagath = User.create!(first_name: "Bhagath", last_name: "Reddy", email: "bhagath@example.com", password: "password2")
	  login_as(@bharath)
	end

	scenario "if signed in succeeds" do
	  visit "/"
	  expect(page).to have_content(@bharath.full_name)
	  expect(page).to have_content(@bhagath.full_name)
      expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@bharath.id}")

	  link = "a[href='/friendships?friend_id=#{@bhagath.id}']"
	  find(link).click

	  expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@bhagath.id}")
    end
end