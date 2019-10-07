require 'rails_helper'

RSpec.describe "users/users/show", type: :view do
  before(:each) do
    @users_user = assign(:users_user, Users::User.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
