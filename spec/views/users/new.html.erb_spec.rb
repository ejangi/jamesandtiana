require 'spec_helper'

describe "users/new.html.erb" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :street => "MyString",
      :suburb => "MyString",
      :postcode => 1
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_phone", :name => "user[phone]"
      assert_select "input#user_street", :name => "user[street]"
      assert_select "input#user_suburb", :name => "user[suburb]"
      assert_select "input#user_postcode", :name => "user[postcode]"
    end
  end
end
