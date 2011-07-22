require 'spec_helper'

describe "registries/index.html.erb" do
  before(:each) do
    assign(:registries, [
      stub_model(Registry,
        :title => "Title",
        :introduction => "MyText"
      ),
      stub_model(Registry,
        :title => "Title",
        :introduction => "MyText"
      )
    ])
  end

  it "renders a list of registries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
