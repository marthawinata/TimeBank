require "spec_helper"

describe BoardgamesController do
  describe "routing" do

    it "routes to #index" do
      get("/boardgames").should route_to("boardgames#index")
    end

    it "routes to #new" do
      get("/boardgames/new").should route_to("boardgames#new")
    end

    it "routes to #show" do
      get("/boardgames/1").should route_to("boardgames#show", :id => "1")
    end

    it "routes to #edit" do
      get("/boardgames/1/edit").should route_to("boardgames#edit", :id => "1")
    end

    it "routes to #create" do
      post("/boardgames").should route_to("boardgames#create")
    end

    it "routes to #update" do
      put("/boardgames/1").should route_to("boardgames#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/boardgames/1").should route_to("boardgames#destroy", :id => "1")
    end

  end
end
