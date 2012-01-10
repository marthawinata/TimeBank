require 'spec_helper'

describe "meetups/index.html.erb" do
  before(:each) do
    assign(:meetups, [
      stub_model(Meetup,
        :host_player_id => 1,
        :confirmed_venue => "MyText",
        :meetup_type_id => "Meetup Type",
        :venue_link => "MyText",
        :invitation_type_id => "Invitation Type"
      ),
      stub_model(Meetup,
        :host_player_id => 1,
        :confirmed_venue => "MyText",
        :meetup_type_id => "Meetup Type",
        :venue_link => "MyText",
        :invitation_type_id => "Invitation Type"
      )
    ])
  end

  it "renders a list of meetups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Meetup Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Invitation Type".to_s, :count => 2
  end
end
