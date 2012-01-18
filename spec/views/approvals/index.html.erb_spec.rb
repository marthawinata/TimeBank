require 'spec_helper'

describe "approvals/index.html.erb" do
  before(:each) do
    assign(:approvals, [
      stub_model(Approval,
        :meetup_id => 1,
        :user_id => 1,
        :is_approved => false,
        :status => 1
      ),
      stub_model(Approval,
        :meetup_id => 1,
        :user_id => 1,
        :is_approved => false,
        :status => 1
      )
    ])
  end

  it "renders a list of approvals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
