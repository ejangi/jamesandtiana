require 'spec_helper'

describe "Registries" do
  describe "GET /registries" do
    it "GET /registries" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get registries_path
      response.status.should be(200)
    end
  end
  
  describe "GET /wedding" do
    it "GET /wedding" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get '/wedding'
      response.status.should be(200)
    end
  end
  
  describe "GET /engagement" do
    it "GET /engagement" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get '/engagement'
      response.status.should be(200)
    end
  end
end
