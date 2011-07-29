require 'spec_helper'

describe "contributions/new.html.erb" do
  before(:each) do
    assign(:contribution, stub_model(Contribution,
      :user => "MyString",
      :registry => "MyString",
      :gift => "MyString",
      :amount => ""
    ).as_new_record)
  end

  it "renders new contribution form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contributions_path, :method => "post" do
      assert_select "input#contribution_user", :name => "contribution[user]"
      assert_select "input#contribution_registry", :name => "contribution[registry]"
      assert_select "input#contribution_gift", :name => "contribution[gift]"
      assert_select "input#contribution_amount", :name => "contribution[amount]"
    end
  end
end
