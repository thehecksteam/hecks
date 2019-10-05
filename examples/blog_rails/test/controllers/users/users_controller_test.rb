require 'test_helper'

class Users::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_user = users_users(:one)
  end

  test "should get index" do
    get users_users_url
    assert_response :success
  end

  test "should get new" do
    get new_users_user_url
    assert_response :success
  end

  test "should create users_user" do
    assert_difference('Users::User.count') do
      post users_users_url, params: { users_user: { name: @users_user.name } }
    end

    assert_redirected_to users_user_url(Users::User.last)
  end

  test "should show users_user" do
    get users_user_url(@users_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_user_url(@users_user)
    assert_response :success
  end

  test "should update users_user" do
    patch users_user_url(@users_user), params: { users_user: { name: @users_user.name } }
    assert_redirected_to users_user_url(@users_user)
  end

  test "should destroy users_user" do
    assert_difference('Users::User.count', -1) do
      delete users_user_url(@users_user)
    end

    assert_redirected_to users_users_url
  end
end
