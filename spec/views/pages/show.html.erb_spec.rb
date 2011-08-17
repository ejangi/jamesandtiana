require 'spec_helper'

describe "pages/show.html.erb" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :title => "Title",
      :permalink => "Permalink",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Permalink/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
