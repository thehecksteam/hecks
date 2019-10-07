require 'rails_helper'

RSpec.describe "users/users/edit", type: :view do
  before(:each) do
    @users_user = assign(:users_user, Users::User.create!())
  end

  it "renders the edit users_user form" do
    render

    assert_select "form[action=?][method=?]", users_user_path(@users_user), "post" do
    end
  end
end
