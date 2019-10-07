require 'rails_helper'

RSpec.describe "users/users/new", type: :view do
  before(:each) do
    assign(:users_user, Users::User.new())
  end

  it "renders new users_user form" do
    render

    assert_select "form[action=?][method=?]", users_users_path, "post" do
    end
  end
end
