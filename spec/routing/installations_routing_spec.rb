require "spec_helper"

describe InstallationsController do
  describe "routing" do

    it "routes to #index" do
      get("/installations").should route_to("installations#index")
    end

    it "routes to #new" do
      get("/installations/new").should route_to("installations#new")
    end

    it "routes to #show" do
      get("/installations/1").should route_to("installations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/installations/1/edit").should route_to("installations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/installations").should route_to("installations#create")
    end

    it "routes to #update" do
      put("/installations/1").should route_to("installations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/installations/1").should route_to("installations#destroy", :id => "1")
    end

  end
end
