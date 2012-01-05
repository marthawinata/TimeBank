require "spec_helper"

describe AvailableBoardgamesController do
  describe "routing" do

    it "routes to #index" do
      get("/available_boardgames").should route_to("available_boardgames#index")
    end

    it "routes to #new" do
      get("/available_boardgames/new").should route_to("available_boardgames#new")
    end

    it "routes to #show" do
      get("/available_boardgames/1").should route_to("available_boardgames#show", :id => "1")
    end

    it "routes to #edit" do
      get("/available_boardgames/1/edit").should route_to("available_boardgames#edit", :id => "1")
    end

    it "routes to #create" do
      post("/available_boardgames").should route_to("available_boardgames#create")
    end

    it "routes to #update" do
      put("/available_boardgames/1").should route_to("available_boardgames#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/available_boardgames/1").should route_to("available_boardgames#destroy", :id => "1")
    end

  end
end
