require 'spec_helper'

describe "approvals/show.html.erb" do
  before(:each) do
    @approval = assign(:approval, stub_model(Approval,
      :meetup_id => 1,
      :user_id => 1,
      :is_approved => false,
      :status => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
