require 'spec_helper'

describe "registries/new.html.erb" do
  before(:each) do
    assign(:registry, stub_model(Registry,
      :title => "MyString",
      :introduction => "MyText"
    ).as_new_record)
  end

  it "renders new registry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => registries_path, :method => "post" do
      assert_select "input#registry_title", :name => "registry[title]"
      assert_select "textarea#registry_introduction", :name => "registry[introduction]"
    end
  end
end
