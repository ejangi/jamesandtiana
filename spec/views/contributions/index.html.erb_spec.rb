require 'spec_helper'

describe "contributions/index.html.erb" do
  before(:each) do
    assign(:contributions, [
      stub_model(Contribution,
        :user => "User",
        :registry => "Registry",
        :gift => "Gift",
        :amount => ""
      ),
      stub_model(Contribution,
        :user => "User",
        :registry => "Registry",
        :gift => "Gift",
        :amount => ""
      )
    ])
  end

  it "renders a list of contributions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Registry".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Gift".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
