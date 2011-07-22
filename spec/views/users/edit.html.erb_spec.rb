require 'spec_helper'

describe "users/edit.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :street => "MyString",
      :suburb => "MyString",
      :postcode => 1
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_phone", :name => "user[phone]"
      assert_select "input#user_street", :name => "user[street]"
      assert_select "input#user_suburb", :name => "user[suburb]"
      assert_select "input#user_postcode", :name => "user[postcode]"
    end
  end
end
