require 'spec_helper'

describe "boardgames/new.html.erb" do
  before(:each) do
    assign(:boardgame, stub_model(Boardgame,
      :bgg_id => 1,
      :name => "MyString",
      :parent_boardgame_id => 1,
      :is_standalone => false
    ).as_new_record)
  end

  it "renders new boardgame form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => boardgames_path, :method => "post" do
      assert_select "input#boardgame_bgg_id", :name => "boardgame[bgg_id]"
      assert_select "input#boardgame_name", :name => "boardgame[name]"
      assert_select "input#boardgame_parent_boardgame_id", :name => "boardgame[parent_boardgame_id]"
      assert_select "input#boardgame_is_standalone", :name => "boardgame[is_standalone]"
    end
  end
end
