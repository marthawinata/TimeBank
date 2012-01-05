require 'spec_helper'

describe "collections/new.html.erb" do
  before(:each) do
    assign(:collection, stub_model(Collection,
      :player_id => 1,
      :boardgame_id => 1,
      :bought_at => "MyText"
    ).as_new_record)
  end

  it "renders new collection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => collections_path, :method => "post" do
      assert_select "input#collection_player_id", :name => "collection[player_id]"
      assert_select "input#collection_boardgame_id", :name => "collection[boardgame_id]"
      assert_select "textarea#collection_bought_at", :name => "collection[bought_at]"
    end
  end
end
