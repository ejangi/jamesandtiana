require 'spec_helper'

describe "registries/show.html.erb" do
  before(:each) do
    @registry = assign(:registry, stub_model(Registry,
      :title => "Title",
      :introduction => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
