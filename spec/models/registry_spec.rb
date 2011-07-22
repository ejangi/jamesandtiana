require 'spec_helper'

describe Registry do
  it "can be instantiated" do
    Registry.new.should be_an_instance_of(Registry)
  end

  it "can be saved successfully" do
    Registry.create.should be_persisted
  end
end
