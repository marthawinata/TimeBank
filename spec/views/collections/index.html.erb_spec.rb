require 'spec_helper'

describe "collections/index.html.erb" do
  before(:each) do
    assign(:collections, [
      stub_model(Collection,
        :player_id => 1,
        :boardgame_id => 1,
        :bought_at => "MyText"
      ),
      stub_model(Collection,
        :player_id => 1,
        :boardgame_id => 1,
        :bought_at => "MyText"
      )
    ])
  end

  it "renders a list of collections" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
