require 'spec_helper'

describe "available_boardgames/show.html.erb" do
  before(:each) do
    @available_boardgame = assign(:available_boardgame, stub_model(AvailableBoardgame,
      :collection_id => 1,
      :meetup_id => 1
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
