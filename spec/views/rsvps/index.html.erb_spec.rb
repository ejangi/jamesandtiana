require 'spec_helper'

describe "rsvps/index.html.erb" do
  before(:each) do
    assign(:rsvps, [
      stub_model(Rsvp,
        :user => "User",
        :registry => "Registry",
        :attending => false,
        :number_of_guests => 1,
        :dietary_requirements => "MyText"
      ),
      stub_model(Rsvp,
        :user => "User",
        :registry => "Registry",
        :attending => false,
        :number_of_guests => 1,
        :dietary_requirements => "MyText"
      )
    ])
  end

  it "renders a list of rsvps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Registry".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
