require 'spec_helper'

describe "gifts/index.html.erb" do
  before(:each) do
    assign(:gifts, [
      stub_model(Gift,
        :title => "Title",
        :description => "MyText",
        :store => "Store",
        :colour => "Colour",
        :quantity => 1,
        :price => "9.99"
      ),
      stub_model(Gift,
        :title => "Title",
        :description => "MyText",
        :store => "Store",
        :colour => "Colour",
        :quantity => 1,
        :price => "9.99"
      )
    ])
  end

  it "renders a list of gifts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Store".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Colour".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
