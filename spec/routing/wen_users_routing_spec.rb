require "spec_helper"

describe WenUsersController do
  describe "routing" do

    it "routes to #index" do
      get("/wen_users").should route_to("wen_users#index")
    end

    it "routes to #new" do
      get("/wen_users/new").should route_to("wen_users#new")
    end

    it "routes to #show" do
      get("/wen_users/1").should route_to("wen_users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wen_users/1/edit").should route_to("wen_users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wen_users").should route_to("wen_users#create")
    end

    it "routes to #update" do
      put("/wen_users/1").should route_to("wen_users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wen_users/1").should route_to("wen_users#destroy", :id => "1")
    end

  end
end
