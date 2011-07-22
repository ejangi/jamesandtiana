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
end
