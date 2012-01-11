require 'spec_helper'

describe "proposed_timings/edit.html.erb" do
  before(:each) do
    @proposed_timing = assign(:proposed_timing, stub_model(ProposedTiming,
      :meetup_id => 1,
      :proposed_by_user => 1
    ))
  end

  it "renders the edit proposed_timing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => proposed_timings_path(@proposed_timing), :method => "post" do
      assert_select "input#proposed_timing_meetup_id", :name => "proposed_timing[meetup_id]"
      assert_select "input#proposed_timing_proposed_by_player", :name => "proposed_timing[proposed_by_player]"
    end
  end
end
