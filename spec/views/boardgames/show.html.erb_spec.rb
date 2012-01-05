require 'spec_helper'

describe "boardgames/show.html.erb" do
  before(:each) do
    @boardgame = assign(:boardgame, stub_model(Boardgame,
      :bgg_id => 1,
      :name => "Name",
      :parent_boardgame_id => 1,
      :is_standalone => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
