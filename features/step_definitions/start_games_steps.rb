When /^I start a new game$/ do
  
  click_button "Create new game"
end

Then /^I should see "([^"]*)"$/ do |message|
  page.should have_content(message)
end

Then /^I should not see "([^"]*)"$/ do |arg1|
  page.should_not have_content(message)
end

Given /^a game of (\w*) with (\d+) players$/ do |arg1|
  visit "/"
  pending # express the regexp above with the code you wish you had
end

Given /^players in (.*)$/ do
  pending # express the regexp above with the code you wish you had
end


Then /^<player_names> are playing$/ do
  pending # express the regexp above with the code you wish you had
end


