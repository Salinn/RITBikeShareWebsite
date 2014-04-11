require 'test_helper'

class CantCheckOutBikesControllerTest < ActionController::TestCase
  setup do
    @cant_check_out_bike = cant_check_out_bikes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cant_check_out_bikes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cant_check_out_bike" do
    assert_difference('CantCheckOutBike.count') do
      post :create, cant_check_out_bike: {  }
    end

    assert_redirected_to cant_check_out_bike_path(assigns(:cant_check_out_bike))
  end

  test "should show cant_check_out_bike" do
    get :show, id: @cant_check_out_bike
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cant_check_out_bike
    assert_response :success
  end

  test "should update cant_check_out_bike" do
    patch :update, id: @cant_check_out_bike, cant_check_out_bike: {  }
    assert_redirected_to cant_check_out_bike_path(assigns(:cant_check_out_bike))
  end

  test "should destroy cant_check_out_bike" do
    assert_difference('CantCheckOutBike.count', -1) do
      delete :destroy, id: @cant_check_out_bike
    end

    assert_redirected_to cant_check_out_bikes_path
  end
end
