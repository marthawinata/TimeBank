require 'spec_helper'

describe "proposed_timings/index.html.erb" do
  before(:each) do
    assign(:proposed_timings, [
      stub_model(ProposedTiming,
        :meetup_id => 1,
        :proposed_by_player => 1
      ),
      stub_model(ProposedTiming,
        :meetup_id => 1,
        :proposed_by_player => 1
      )
    ])
  end

  it "renders a list of proposed_timings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
