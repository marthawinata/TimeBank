When /^I start a new game$/ do  
  click_button "press to continue"
end

Then /^I should see ([^"]*)$/ do |message|
  page.should have_content(message)
end

Then /^I should not see "([^"]*)"$/ do |message|
  page.should_not have_content(message)
end

Given /^a game of (\w*) with (\d+) players$/ do |game_name, num_players|
  visit "/"
  click_link "New Game"
  fill_in "Name", :with => game_name
  fill_in "Number of players", :with => num_players
  click_button "Create new game"
end

Given /^players in (.*)$/ do |player_names|
  player_names.split(",").each_with_index.map do |player_name, index|
    fill_in "Player \##{index + 1} name", :with => player_name
  end
  click_button "Start game!"
end


Then /^(.*) are playing$/ do |player_names|
  player_names.split(",").each do |player_name|
    page.should have_css(".player-name", :value => player_name)
  end
end


