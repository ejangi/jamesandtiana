require 'spec_helper'

describe Registry do
  it "can be instantiated" do
    Registry.new.should be_an_instance_of(Registry)
  end

  it "can be saved successfully" do
    Registry.create.should be_persisted
  end
  
  it "can list all" do
    Registry.all.should == []
  end
  
  it "can list titles as an array" do
    [
      { :title => "The Engagement", :introduction => "", :when => "2011-09-24 14:00:00", :permalink => "engagement" },
      { :title => "The Wedding", :introduction => "", :when => "2012-01-06 15:00:00", :permalink => "wedding" }
    ].each do |attributes|
      Registry.find_or_create_by_permalink(attributes)
    end

    Registry.permalink_list.include?("wedding").should == true
    Registry.permalink_list.include?("engagement").should == true
  end
end
