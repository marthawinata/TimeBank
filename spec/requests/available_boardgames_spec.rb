require 'spec_helper'

describe "AvailableBoardgames" do
  describe "GET /available_boardgames" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get available_boardgames_path
      response.status.should be(200)
    end
  end
end
