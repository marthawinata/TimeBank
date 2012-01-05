require 'spec_helper'

describe "available_boardgames/index.html.erb" do
  before(:each) do
    assign(:available_boardgames, [
      stub_model(AvailableBoardgame,
        :collection_id => 1,
        :meetup_id => 1
      ),
      stub_model(AvailableBoardgame,
        :collection_id => 1,
        :meetup_id => 1
      )
    ])
  end

  it "renders a list of available_boardgames" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
