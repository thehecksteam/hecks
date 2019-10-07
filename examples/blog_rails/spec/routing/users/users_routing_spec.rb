require "rails_helper"

RSpec.describe Users::UsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/users/users").to route_to("users/users#index")
    end

    it "routes to #new" do
      expect(:get => "/users/users/new").to route_to("users/users#new")
    end

    it "routes to #show" do
      expect(:get => "/users/users/1").to route_to("users/users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/users/users/1/edit").to route_to("users/users#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/users/users").to route_to("users/users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/users/users/1").to route_to("users/users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users/users/1").to route_to("users/users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/users/users/1").to route_to("users/users#destroy", :id => "1")
    end
  end
end
