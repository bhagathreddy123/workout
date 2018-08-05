require "rails_helper"

RSpec.feature "Users signin" do

before do
  @bhagath = User.create!(first_name: "bhagath", last_name: "reddy",
  	                   email: "bhagath@gmail.com", password: "password")
end

scenario "with valid credentials" do

visit "/"

click_link "Sign in"

fill_in "Email", with: @bhagath.email

fill_in "Password", with: @bhagath.password

click_button "Log in"

expect(page).to have_content("Signed in successfully.")

expect(page).to have_content("Signed in as #{@bhagath.email}")

end

end