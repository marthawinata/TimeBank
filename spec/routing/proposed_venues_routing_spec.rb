require "spec_helper"

describe ProposedVenuesController do
  describe "routing" do

    it "routes to #index" do
      get("/proposed_venues").should route_to("proposed_venues#index")
    end

    it "routes to #new" do
      get("/proposed_venues/new").should route_to("proposed_venues#new")
    end

    it "routes to #show" do
      get("/proposed_venues/1").should route_to("proposed_venues#show", :id => "1")
    end

    it "routes to #edit" do
      get("/proposed_venues/1/edit").should route_to("proposed_venues#edit", :id => "1")
    end

    it "routes to #create" do
      post("/proposed_venues").should route_to("proposed_venues#create")
    end

    it "routes to #update" do
      put("/proposed_venues/1").should route_to("proposed_venues#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/proposed_venues/1").should route_to("proposed_venues#destroy", :id => "1")
    end

  end
end
