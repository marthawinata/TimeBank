require 'spec_helper'

describe "GameSessions" do
  before(:each) do
    visit '/'
    if page.has_link? "Logout"
      click_link "Logout"
    end

    email = 'who@cares.com'
    password = 'lalala'
    User.new(:email => email, :password => password, :password_confirmation => password).save!

    click_link "Login"
    fill_in "user[email]", :with => email
    fill_in "user[password]", :with => password
    click_button "Sign in"
  end

  describe "create new game" do
    it "should be successful with defaults" do
      lambda do
        visit '/'
        click_link "New Game"
        click_button "Create new game"

        page.should have_content("Entering player details")
        Game.first.should_not be_nil
        Game.first.should have_same_attributes_as Factory(:game)

      end.should change(Game, :count)
    end
    it "should be successful" do
      lambda do
        visit '/'
        click_link "New Game"
        fill_in "game_name", :with => "Imperial"
        fill_in "Number of players", :with => "5"
        click_button "Create new game"

        page.should have_content("Entering player details")

        Game.first.should_not be_nil
        Game.first.should have_same_attributes_as Factory(:game, { :name => "Imperial", :number_of_players => 5 })
      end.should change(Game, :count)
    end
    it "should require validation" do
      lambda do
        visit '/'
        click_link "New Game"
        fill_in "game_name", :with => "Imperial"
        fill_in "Number of players", :with => "abc"
        click_button "Create new game"

        page.should_not have_content("Entering player details")
      end.should_not change(Game, :count)
    end
  end
end
