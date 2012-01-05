require 'spec_helper'

describe "available_boardgames/edit.html.erb" do
  before(:each) do
    @available_boardgame = assign(:available_boardgame, stub_model(AvailableBoardgame,
      :collection_id => 1,
      :meetup_id => 1
    ))
  end

  it "renders the edit available_boardgame form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => available_boardgames_path(@available_boardgame), :method => "post" do
      assert_select "input#available_boardgame_collection_id", :name => "available_boardgame[collection_id]"
      assert_select "input#available_boardgame_meetup_id", :name => "available_boardgame[meetup_id]"
    end
  end
end
