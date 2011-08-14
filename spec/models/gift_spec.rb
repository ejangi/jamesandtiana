require 'spec_helper'

describe Gift do
  it "can be instantiated" do
      Gift.new.should be_an_instance_of(Gift)
    end

  it "can be saved successfully" do
    Gift.create.should be_persisted
  end
  
  it "should have have a photo field" do
    gift = Gift.new
    gift.photo_url.to_s.should != ""
  end
  
  it "reorders correctly" do
    Gift.create({ :title => "Test", :description => "Testing", :store => "Myer", :colour => "Red", :quantity => 1, :price => 100 })
    Gift.create({ :title => "Test", :description => "Testing", :store => "Myer", :colour => "Red", :quantity => 1, :price => 100 })
    Gift.refresh_ordering
    gifts = Gift.find(:all)
    gifts.first.ordering.should == 1
  end
  
  it "can reorder according to an array of IDs" do
    g1 = Gift.new({ :title => "Test", :description => "Testing", :store => "Myer", :colour => "Red", :quantity => 1, :price => 100 })
    g1.id = 1001
    g1.save(:validate => false)
    g2 = Gift.new({ :title => "Test", :description => "Testing", :store => "Myer", :colour => "Red", :quantity => 1, :price => 100 })
    g2.id = 1002
    g2.save(:validate => false)
    Gift.ordering_like([1002, 1001])
    gifts = Gift.find(:all)
    gifts.first.id.should == 1002
  end
end
