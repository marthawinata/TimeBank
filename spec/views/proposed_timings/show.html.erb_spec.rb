require 'spec_helper'

describe "proposed_timings/show.html.erb" do
  before(:each) do
    @proposed_timing = assign(:proposed_timing, stub_model(ProposedTiming,
      :meetup_id => 1,
      :proposed_by_player => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
