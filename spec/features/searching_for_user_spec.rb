require "rails_helper"

RSpec.feature "Searching for User" do
	before do
		@bharath = User.create!(first_name: "Bharath", last_name: "Reddy", email: "bharath@example.com", password: "password1")
		@bhagath = User.create!(first_name: "Bhagath", last_name: "Reddy", email: "bhagath@example.com", password: "password2")
	end

	scenario "with existing name return all those users" do
		visit "/"
		fill_in "Search_name", with: "Reddy"
		click_button "Search"

		expect(page).to have_content(@bhagath.full_name)
		expect(page).to have_content(@bhagath.full_name)
        expect(current_path).to eq("/dashboard/search")   
	end
end