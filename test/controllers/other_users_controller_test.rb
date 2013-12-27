require 'test_helper'

class OtherUsersControllerTest < ActionController::TestCase
  setup do
    @other_user = other_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:other_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create other_user" do
    assert_difference('OtherUser.count') do
      post :create, other_user: { other_email: @other_user.other_email, rit_user_id: @other_user.rit_user_id }
    end

    assert_redirected_to other_user_path(assigns(:other_user))
  end

  test "should show other_user" do
    get :show, id: @other_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @other_user
    assert_response :success
  end

  test "should update other_user" do
    patch :update, id: @other_user, other_user: { other_email: @other_user.other_email, rit_user_id: @other_user.rit_user_id }
    assert_redirected_to other_user_path(assigns(:other_user))
  end

  test "should destroy other_user" do
    assert_difference('OtherUser.count', -1) do
      delete :destroy, id: @other_user
    end

    assert_redirected_to other_users_path
  end
end
