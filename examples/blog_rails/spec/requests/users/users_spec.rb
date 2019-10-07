require 'rails_helper'

RSpec.describe "Users::Users", type: :request do
  describe "GET /users/users" do
    it "works! (now write some real specs)" do
      get users_users_path
      expect(response).to have_http_status(200)
    end
  end
end
