require 'spec_helper'

describe BggScraperController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'scrape_game'" do
    it "returns http success" do
      get 'scrape_game'
      response.should be_success
    end
  end

end
