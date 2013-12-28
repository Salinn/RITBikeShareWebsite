require 'test_helper'

class CheckedOutsControllerTest < ActionController::TestCase
  setup do
    @checked_out = checked_outs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checked_outs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checked_out" do
    assert_difference('CheckedOut.count') do
      post :create, checked_out: { bike_id: @checked_out.bike_id, bike_user_id: @checked_out.bike_user_id, checkin_time: @checked_out.checkin_time, checkout_time: @checked_out.checkout_time, fixed: @checked_out.fixed, problem: @checked_out.problem }
    end

    assert_redirected_to checked_out_path(assigns(:checked_out))
  end

  test "should show checked_out" do
    get :show, id: @checked_out
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checked_out
    assert_response :success
  end

  test "should update checked_out" do
    patch :update, id: @checked_out, checked_out: { bike_id: @checked_out.bike_id, bike_user_id: @checked_out.bike_user_id, checkin_time: @checked_out.checkin_time, checkout_time: @checked_out.checkout_time, fixed: @checked_out.fixed, problem: @checked_out.problem }
    assert_redirected_to checked_out_path(assigns(:checked_out))
  end

  test "should destroy checked_out" do
    assert_difference('CheckedOut.count', -1) do
      delete :destroy, id: @checked_out
    end

    assert_redirected_to checked_outs_path
  end
end
