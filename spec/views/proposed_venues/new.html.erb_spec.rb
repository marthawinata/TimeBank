require 'spec_helper'

describe "proposed_venues/new.html.erb" do
  before(:each) do
    assign(:proposed_venue, stub_model(ProposedVenue,
      :meetup_id => 1,
      :proposed_by_user => 1,
      :description => "MyText",
      :venue_link => "MyText"
    ).as_new_record)
  end

  it "renders new proposed_venue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => proposed_venues_path, :method => "post" do
      assert_select "input#proposed_venue_meetup_id", :name => "proposed_venue[meetup_id]"
      assert_select "input#proposed_venue_proposed_by_player", :name => "proposed_venue[proposed_by_player]"
      assert_select "textarea#proposed_venue_description", :name => "proposed_venue[description]"
      assert_select "textarea#proposed_venue_venue_link", :name => "proposed_venue[venue_link]"
    end
  end
end
