require "rails_helper"

RSpec.feature "Showing Friend Workout" do

before do

@bhagath = User.create(first_name: "Bhagath", last_name: "Reddy", email: "bhagath@example.com", password: "password")

@bharath = User.create(first_name: "Bharath", last_name: "Reddy", email: "bharath@example.com", password: "password")

@e1 = @bhagath.exercises.create(duration_in_min: 74, workout: "Weight lifting routine",

workout_date: Date.today)

@e2 = @bharath.exercises.create(duration_in_min: 55, workout: "Bharath weight lifting routine",

workout_date: Date.today)

login_as(@bhagath)

@following = Friendship.create(user: @bhagath, friend: @bharath)

end

scenario "shows friend's workout for last 7 days" do

visit "/"

click_link "My Lounge"

click_link @bharath.full_name

expect(page).to have_content(@bharath.full_name + "'s Exercises")

expect(page).to have_content(@e2.workout)

expect(page).to have_css("div#chart")

end

end