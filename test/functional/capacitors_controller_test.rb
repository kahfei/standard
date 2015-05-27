require 'test_helper'

class CapacitorsControllerTest < ActionController::TestCase
  setup do
    @capacitor = capacitors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:capacitors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create capacitor" do
    assert_difference('Capacitor.count') do
      post :create, :capacitor => @capacitor.attributes
    end

    assert_redirected_to capacitor_path(assigns(:capacitor))
  end

  test "should show capacitor" do
    get :show, :id => @capacitor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @capacitor.to_param
    assert_response :success
  end

  test "should update capacitor" do
    put :update, :id => @capacitor.to_param, :capacitor => @capacitor.attributes
    assert_redirected_to capacitor_path(assigns(:capacitor))
  end

  test "should destroy capacitor" do
    assert_difference('Capacitor.count', -1) do
      delete :destroy, :id => @capacitor.to_param
    end

    assert_redirected_to capacitors_path
  end
end
