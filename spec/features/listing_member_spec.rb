require "rails_helper"
RSpec.feature "Listing Members" do 
	before do
		@bharath = User.create!(first_name: "Bharath", last_name: "Reddy", email: "bharath@example.com", password: "password1")
		@bhagath = User.create!(first_name: "Bhagath", last_name: "Reddy", email: "bhagath@example.com", password: "password2")
	end
 scenario "shows a registered members" do
 	visit "/"
 	expect(:page).to have_content("list of Members")
 	expect(:page).to have_content(@bharath.full_name)
 	expect(:page).to have_content(@bhagath.full_name)
 	expect(:page).to have_content(@bharath.email)
 	expect(:page).to have_content(@bhagath.email)
 end
	
end