require 'test_helper'

class RitUsersControllerTest < ActionController::TestCase
  setup do
    @rit_user = rit_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rit_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rit_user" do
    assert_difference('RitUser.count') do
      post :create, rit_user: { admin: @rit_user.admin, rit_email: @rit_user.rit_email, user_id: @rit_user.user_id }
    end

    assert_redirected_to rit_user_path(assigns(:rit_user))
  end

  test "should show rit_user" do
    get :show, id: @rit_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rit_user
    assert_response :success
  end

  test "should update rit_user" do
    patch :update, id: @rit_user, rit_user: { admin: @rit_user.admin, rit_email: @rit_user.rit_email, user_id: @rit_user.user_id }
    assert_redirected_to rit_user_path(assigns(:rit_user))
  end

  test "should destroy rit_user" do
    assert_difference('RitUser.count', -1) do
      delete :destroy, id: @rit_user
    end

    assert_redirected_to rit_users_path
  end
end
