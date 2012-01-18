require 'spec_helper'

describe "approvals/edit.html.erb" do
  before(:each) do
    @approval = assign(:approval, stub_model(Approval,
      :meetup_id => 1,
      :user_id => 1,
      :is_approved => false,
      :status => 1
    ))
  end

  it "renders the edit approval form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => approvals_path(@approval), :method => "post" do
      assert_select "input#approval_meetup_id", :name => "approval[meetup_id]"
      assert_select "input#approval_user_id", :name => "approval[user_id]"
      assert_select "input#approval_is_approved", :name => "approval[is_approved]"
      assert_select "input#approval_status", :name => "approval[status]"
    end
  end
end
