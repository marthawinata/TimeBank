require 'spec_helper'

describe "meetups/edit.html.erb" do
  before(:each) do
    @meetup = assign(:meetup, stub_model(Meetup,
      :host_player_id => 1,
      :confirmed_venue => "MyText",
      :meetup_type_id => "MyString",
      :venue_link => "MyText",
      :invitation_type_id => "MyString"
    ))
  end

  it "renders the edit meetup form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => meetups_path(@meetup), :method => "post" do
      assert_select "input#meetup_host_player_id", :name => "meetup[host_player_id]"
      assert_select "textarea#meetup_confirmed_venue", :name => "meetup[confirmed_venue]"
      assert_select "input#meetup_meetup_type", :name => "meetup[meetup_type]"
      assert_select "textarea#meetup_venue_link", :name => "meetup[venue_link]"
      assert_select "input#meetup_invitation_type", :name => "meetup[invitation_type]"
    end
  end
end
