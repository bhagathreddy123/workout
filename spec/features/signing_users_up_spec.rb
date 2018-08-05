require "rails_helper"

RSpec.feature "Users signup" do

scenario "with valid credentials" do

visit "/"

click_link "Sign up"
fill_in "First Name", with: "Bhagath"
fill_in "Last Name", with: "Reddy"

fill_in "Email", with: "user@example.com"

fill_in "Password", with: "password"

fill_in "Password confirmation", with: "password"

click_button "Sign up"

expect(page).to have_content("You have signed up successfully.")
expect(page).to have_content("Bhagath Reddy")
end

end