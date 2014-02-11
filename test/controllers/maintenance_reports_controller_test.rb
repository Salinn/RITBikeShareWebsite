require 'test_helper'

class MaintenanceReportsControllerTest < ActionController::TestCase
  setup do
    @maintenance_report = maintenance_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maintenance_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maintenance_report" do
    assert_difference('MaintenanceReport.count') do
      post :create, maintenance_report: {  }
    end

    assert_redirected_to maintenance_report_path(assigns(:maintenance_report))
  end

  test "should show maintenance_report" do
    get :show, id: @maintenance_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maintenance_report
    assert_response :success
  end

  test "should update maintenance_report" do
    patch :update, id: @maintenance_report, maintenance_report: {  }
    assert_redirected_to maintenance_report_path(assigns(:maintenance_report))
  end

  test "should destroy maintenance_report" do
    assert_difference('MaintenanceReport.count', -1) do
      delete :destroy, id: @maintenance_report
    end

    assert_redirected_to maintenance_reports_path
  end
end
