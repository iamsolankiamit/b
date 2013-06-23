require "spec_helper"

describe FloodsController do
  describe "routing" do

    it "routes to #index" do
      get("/floods").should route_to("floods#index")
    end

    it "routes to #new" do
      get("/floods/new").should route_to("floods#new")
    end

    it "routes to #show" do
      get("/floods/1").should route_to("floods#show", :id => "1")
    end

    it "routes to #edit" do
      get("/floods/1/edit").should route_to("floods#edit", :id => "1")
    end

    it "routes to #create" do
      post("/floods").should route_to("floods#create")
    end

    it "routes to #update" do
      put("/floods/1").should route_to("floods#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/floods/1").should route_to("floods#destroy", :id => "1")
    end

  end
end
