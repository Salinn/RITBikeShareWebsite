require 'test_helper'

class GuestUsersControllerTest < ActionController::TestCase
  setup do
    @guest_user = guest_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guest_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guest_user" do
    assert_difference('GuestUser.count') do
      post :create, guest_user: { other_email: @guest_user.other_email, rit_user_id: @guest_user.rit_user_id }
    end

    assert_redirected_to guest_user_path(assigns(:guest_user))
  end

  test "should show guest_user" do
    get :show, id: @guest_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guest_user
    assert_response :success
  end

  test "should update guest_user" do
    patch :update, id: @guest_user, guest_user: { other_email: @guest_user.other_email, rit_user_id: @guest_user.rit_user_id }
    assert_redirected_to guest_user_path(assigns(:guest_user))
  end

  test "should destroy guest_user" do
    assert_difference('GuestUser.count', -1) do
      delete :destroy, id: @guest_user
    end

    assert_redirected_to guest_users_path
  end
end
