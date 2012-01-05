require 'spec_helper'

describe "proposed_timings/new.html.erb" do
  before(:each) do
    assign(:proposed_timing, stub_model(ProposedTiming,
      :meetup_id => 1,
      :proposed_by_player => 1
    ).as_new_record)
  end

  it "renders new proposed_timing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => proposed_timings_path, :method => "post" do
      assert_select "input#proposed_timing_meetup_id", :name => "proposed_timing[meetup_id]"
      assert_select "input#proposed_timing_proposed_by_player", :name => "proposed_timing[proposed_by_player]"
    end
  end
end
