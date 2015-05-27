require 'test_helper'

class CopperwiresControllerTest < ActionController::TestCase
  setup do
    @copperwire = copperwires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:copperwires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create copperwire" do
    assert_difference('Copperwire.count') do
      post :create, :copperwire => @copperwire.attributes
    end

    assert_redirected_to copperwire_path(assigns(:copperwire))
  end

  test "should show copperwire" do
    get :show, :id => @copperwire.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @copperwire.to_param
    assert_response :success
  end

  test "should update copperwire" do
    put :update, :id => @copperwire.to_param, :copperwire => @copperwire.attributes
    assert_redirected_to copperwire_path(assigns(:copperwire))
  end

  test "should destroy copperwire" do
    assert_difference('Copperwire.count', -1) do
      delete :destroy, :id => @copperwire.to_param
    end

    assert_redirected_to copperwires_path
  end
end
