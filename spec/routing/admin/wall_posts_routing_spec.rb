require "spec_helper"

describe Admin::WallPostsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/wall_posts").should route_to("admin/wall_posts#index")
    end

    it "routes to #new" do
      get("/admin/wall_posts/new").should route_to("admin/wall_posts#new")
    end

    it "routes to #show" do
      get("/admin/wall_posts/1").should route_to("admin/wall_posts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/wall_posts/1/edit").should route_to("admin/wall_posts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/wall_posts").should route_to("admin/wall_posts#create")
    end

    it "routes to #update" do
      put("/admin/wall_posts/1").should route_to("admin/wall_posts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/wall_posts/1").should route_to("admin/wall_posts#destroy", :id => "1")
    end

  end
end
