require 'test_helper'

class BrushHoldersControllerTest < ActionController::TestCase
  setup do
    @brush_holder = brush_holders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brush_holders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brush_holder" do
    assert_difference('BrushHolder.count') do
      post :create, :brush_holder => @brush_holder.attributes
    end

    assert_redirected_to brush_holder_path(assigns(:brush_holder))
  end

  test "should show brush_holder" do
    get :show, :id => @brush_holder.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @brush_holder.to_param
    assert_response :success
  end

  test "should update brush_holder" do
    put :update, :id => @brush_holder.to_param, :brush_holder => @brush_holder.attributes
    assert_redirected_to brush_holder_path(assigns(:brush_holder))
  end

  test "should destroy brush_holder" do
    assert_difference('BrushHolder.count', -1) do
      delete :destroy, :id => @brush_holder.to_param
    end

    assert_redirected_to brush_holders_path
  end
end
