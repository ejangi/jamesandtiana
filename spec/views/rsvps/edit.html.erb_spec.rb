require 'spec_helper'

describe "rsvps/edit.html.erb" do
  before(:each) do
    @rsvp = assign(:rsvp, stub_model(Rsvp,
      :user => "MyString",
      :registry => "MyString",
      :attending => false,
      :number_of_guests => 1,
      :dietary_requirements => "MyText"
    ))
  end

  it "renders the edit rsvp form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rsvps_path(@rsvp), :method => "post" do
      assert_select "input#rsvp_user", :name => "rsvp[user]"
      assert_select "input#rsvp_registry", :name => "rsvp[registry]"
      assert_select "input#rsvp_attending", :name => "rsvp[attending]"
      assert_select "input#rsvp_number_of_guests", :name => "rsvp[number_of_guests]"
      assert_select "textarea#rsvp_dietary_requirements", :name => "rsvp[dietary_requirements]"
    end
  end
end
