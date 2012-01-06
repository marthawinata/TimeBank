Given /^I am logged out$/ do
  visit '/'
  if page.has_link? "Logout"
    click_link "Logout"
  end
end

Given /^I logged in as "([^"]*)" and password "([^"]*)"$/ do  |email, password|

  User.new(:email => email, :password => password, :password_confirmation => password).save!

  click_link "Login"
  fill_in "user[email]", :with => email
  fill_in "user[password]", :with => password
  click_button "Sign in"
end

Given /^I started a game "([^"]*)"$/ do |game_name|
  visit '/'
  click_link "New Game"
  fill_in "Name", :with => game_name
end

Given /^time_per_turn is "([^"]*)"$/ do |time|
  time.split(":").each_with_index.map do |time_fragment, index|
    select time_fragment, :from => "game_time_per_turn_#{index + 4}i"
  end
end

Given /^timebank_per_player is "([^"]*)"$/ do |time|
  time.split(":").each_with_index.map do |time_fragment, index|
    select time_fragment, :from => "game_timebank_per_player_#{index + 4}i"
  end
end

Given /^interlude_per_turn is "([^"]*)"$/ do |time|
  time.split(":").each_with_index.map do |time_fragment, index|
    select time_fragment, :from => "game_interlude_per_turn_#{index + 4}i"
  end
end

Given /^number_of_players is "([^"]*)"$/ do |num_players|
    fill_in "Number of players", :with => num_players
end

When /^I create a new game$/ do
    click_button "Create new game"
end

When /^I enter player details "([^"]*)"$/ do |player_names|
  player_names.split(",").each_with_index.map do |player_name, index|
    fill_in "Player \##{index + 1} name", :with => player_name
  end
end

When /^I start the game$/ do
  click_button "Start game!"
end

When /^I start the round$/ do
  click_button "press to continue"
end

Then /^(\d+) seconds later, I should see "([^"]*)"$/ do |wait_time, expected_text|
  sleep(wait_time.to_i)
  page.find("#timer_area").should have_content(expected_text)
end

Then /^I should see "([^"]*)"$/ do |expected_text|
  page.should have_content(expected_text)
end

When /^(\d+) seconds later, I continue to next player$/ do |wait_time|
  sleep(wait_time.to_i)
  click_button "press to continue"
end

When /^I end the game$/ do
  page.find("#end_game_button").click
end
