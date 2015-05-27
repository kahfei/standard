require 'test_helper'

class BearingsControllerTest < ActionController::TestCase
  setup do
    @bearing = bearings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bearings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bearing" do
    assert_difference('Bearing.count') do
      post :create, :bearing => @bearing.attributes
    end

    assert_redirected_to bearing_path(assigns(:bearing))
  end

  test "should show bearing" do
    get :show, :id => @bearing.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bearing.to_param
    assert_response :success
  end

  test "should update bearing" do
    put :update, :id => @bearing.to_param, :bearing => @bearing.attributes
    assert_redirected_to bearing_path(assigns(:bearing))
  end

  test "should destroy bearing" do
    assert_difference('Bearing.count', -1) do
      delete :destroy, :id => @bearing.to_param
    end

    assert_redirected_to bearings_path
  end
end
