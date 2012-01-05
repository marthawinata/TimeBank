require "spec_helper"

describe ProposedTimingsController do
  describe "routing" do

    it "routes to #index" do
      get("/proposed_timings").should route_to("proposed_timings#index")
    end

    it "routes to #new" do
      get("/proposed_timings/new").should route_to("proposed_timings#new")
    end

    it "routes to #show" do
      get("/proposed_timings/1").should route_to("proposed_timings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/proposed_timings/1/edit").should route_to("proposed_timings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/proposed_timings").should route_to("proposed_timings#create")
    end

    it "routes to #update" do
      put("/proposed_timings/1").should route_to("proposed_timings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/proposed_timings/1").should route_to("proposed_timings#destroy", :id => "1")
    end

  end
end
