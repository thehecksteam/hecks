require 'rails_helper'

RSpec.describe "users/users/index", type: :view do
  before(:each) do
    assign(:users_users, [
      Users::User.create!(),
      Users::User.create!()
    ])
  end

  it "renders a list of users/users" do
    render
  end
end
