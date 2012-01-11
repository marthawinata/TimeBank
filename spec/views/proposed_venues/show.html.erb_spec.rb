require 'spec_helper'

describe "proposed_venues/show.html.erb" do
  before(:each) do
    @proposed_venue = assign(:proposed_venue, stub_model(ProposedVenue,
      :meetup_id => 1,
      :proposed_by_user => 1,
      :description => "MyText",
      :venue_link => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
