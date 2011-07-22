require 'spec_helper'

describe "gifts/show.html.erb" do
  before(:each) do
    @gift = assign(:gift, stub_model(Gift,
      :title => "Title",
      :description => "MyText",
      :store => "Store",
      :colour => "Colour",
      :quantity => 1,
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Store/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Colour/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
