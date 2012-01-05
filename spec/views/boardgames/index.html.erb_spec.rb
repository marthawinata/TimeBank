require 'spec_helper'

describe "boardgames/index.html.erb" do
  before(:each) do
    assign(:boardgames, [
      stub_model(Boardgame,
        :bgg_id => 1,
        :name => "Name",
        :parent_boardgame_id => 1,
        :is_standalone => false
      ),
      stub_model(Boardgame,
        :bgg_id => 1,
        :name => "Name",
        :parent_boardgame_id => 1,
        :is_standalone => false
      )
    ])
  end

  it "renders a list of boardgames" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
