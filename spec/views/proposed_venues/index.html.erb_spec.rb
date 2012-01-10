require 'spec_helper'

describe "proposed_venues/index.html.erb" do
  before(:each) do
    assign(:proposed_venues, [
      stub_model(ProposedVenue,
        :meetup_id => 1,
        :proposed_by_user => 1,
        :description => "MyText",
        :venue_link => "MyText"
      ),
      stub_model(ProposedVenue,
        :meetup_id => 1,
        :proposed_by_user => 1,
        :description => "MyText",
        :venue_link => "MyText"
      )
    ])
  end

  it "renders a list of proposed_venues" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
