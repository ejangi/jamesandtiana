require 'spec_helper'

describe "gifts/edit.html.erb" do
  before(:each) do
    @gift = assign(:gift, stub_model(Gift,
      :title => "MyString",
      :description => "MyText",
      :store => "MyString",
      :colour => "MyString",
      :quantity => 1,
      :price => "9.99"
    ))
  end

  it "renders the edit gift form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gifts_path(@gift), :method => "post" do
      assert_select "input#gift_title", :name => "gift[title]"
      assert_select "textarea#gift_description", :name => "gift[description]"
      assert_select "input#gift_store", :name => "gift[store]"
      assert_select "input#gift_colour", :name => "gift[colour]"
      assert_select "input#gift_quantity", :name => "gift[quantity]"
      assert_select "input#gift_price", :name => "gift[price]"
    end
  end
end
