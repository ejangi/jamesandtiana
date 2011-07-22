require 'spec_helper'

describe "registries/edit.html.erb" do
  before(:each) do
    @registry = assign(:registry, stub_model(Registry,
      :title => "MyString",
      :introduction => "MyText"
    ))
  end

  it "renders the edit registry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => registries_path(@registry), :method => "post" do
      assert_select "input#registry_title", :name => "registry[title]"
      assert_select "textarea#registry_introduction", :name => "registry[introduction]"
    end
  end
end
