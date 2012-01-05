require 'spec_helper'

describe "collections/show.html.erb" do
  before(:each) do
    @collection = assign(:collection, stub_model(Collection,
      :player_id => 1,
      :boardgame_id => 1,
      :bought_at => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
