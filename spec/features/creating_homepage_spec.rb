require "rails_helper"
RSpec.feature "Creating home page" do
	scenario "it should visit home page" do
		visit "/"
		expect(page).to have_link("Athletes Den")
		expect(page).to have_link("home")
		expect(page).to have_content("Workout Lounge")
	end
end