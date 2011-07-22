require "spec_helper"

describe RegistriesController do
  describe "routing" do

    it "routes to #index" do
      get("/registries").should route_to("registries#index")
    end

    it "routes to #new" do
      get("/registries/new").should route_to("registries#new")
    end

    it "routes to #show" do
      get("/registries/1").should route_to("registries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/registries/1/edit").should route_to("registries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/registries").should route_to("registries#create")
    end

    it "routes to #update" do
      put("/registries/1").should route_to("registries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/registries/1").should route_to("registries#destroy", :id => "1")
    end

  end
end
