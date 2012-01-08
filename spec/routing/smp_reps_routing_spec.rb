require "spec_helper"

describe SmpRepsController do
  describe "routing" do

    it "routes to #index" do
      get("/smp_reps").should route_to("smp_reps#index")
    end

    it "routes to #new" do
      get("/smp_reps/new").should route_to("smp_reps#new")
    end

    it "routes to #show" do
      get("/smp_reps/1").should route_to("smp_reps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/smp_reps/1/edit").should route_to("smp_reps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/smp_reps").should route_to("smp_reps#create")
    end

    it "routes to #update" do
      put("/smp_reps/1").should route_to("smp_reps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/smp_reps/1").should route_to("smp_reps#destroy", :id => "1")
    end

  end
end
