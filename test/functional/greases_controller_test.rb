require 'test_helper'

class GreasesControllerTest < ActionController::TestCase
  setup do
    @grease = greases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:greases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grease" do
    assert_difference('Grease.count') do
      post :create, :grease => @grease.attributes
    end

    assert_redirected_to grease_path(assigns(:grease))
  end

  test "should show grease" do
    get :show, :id => @grease.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @grease.to_param
    assert_response :success
  end

  test "should update grease" do
    put :update, :id => @grease.to_param, :grease => @grease.attributes
    assert_redirected_to grease_path(assigns(:grease))
  end

  test "should destroy grease" do
    assert_difference('Grease.count', -1) do
      delete :destroy, :id => @grease.to_param
    end

    assert_redirected_to greases_path
  end
end
