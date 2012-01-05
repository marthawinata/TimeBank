require 'spec_helper'

describe "meetups/show.html.erb" do
  before(:each) do
    @meetup = assign(:meetup, stub_model(Meetup,
      :host_player_id => 1,
      :confirmed_venue => "MyText",
      :meetup_type => "Meetup Type",
      :venue_link => "MyText",
      :invitation_type => "Invitation Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Meetup Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Invitation Type/)
  end
end
