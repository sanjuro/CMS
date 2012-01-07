require "spec_helper"

describe InstallersController do
  describe "routing" do

    it "routes to #index" do
      get("/installers").should route_to("installers#index")
    end

    it "routes to #new" do
      get("/installers/new").should route_to("installers#new")
    end

    it "routes to #show" do
      get("/installers/1").should route_to("installers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/installers/1/edit").should route_to("installers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/installers").should route_to("installers#create")
    end

    it "routes to #update" do
      put("/installers/1").should route_to("installers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/installers/1").should route_to("installers#destroy", :id => "1")
    end

  end
end
