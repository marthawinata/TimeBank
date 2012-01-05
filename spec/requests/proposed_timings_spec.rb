require 'spec_helper'

describe "ProposedTimings" do
  describe "GET /proposed_timings" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get proposed_timings_path
      response.status.should be(200)
    end
  end
end
