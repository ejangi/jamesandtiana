require 'spec_helper'

describe "contributions/show.html.erb" do
  before(:each) do
    @contribution = assign(:contribution, stub_model(Contribution,
      :user => "User",
      :registry => "Registry",
      :gift => "Gift",
      :amount => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Registry/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Gift/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
