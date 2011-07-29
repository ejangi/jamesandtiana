require 'spec_helper'

describe "rsvps/show.html.erb" do
  before(:each) do
    @rsvp = assign(:rsvp, stub_model(Rsvp,
      :user => "User",
      :registry => "Registry",
      :attending => false,
      :number_of_guests => 1,
      :dietary_requirements => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Registry/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
