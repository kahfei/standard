require 'test_helper'

class CarbonBrushImportsControllerTest < ActionController::TestCase
  setup do
    @carbon_brush_import = carbon_brush_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carbon_brush_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create carbon_brush_import" do
    assert_difference('CarbonBrushImport.count') do
      post :create, carbon_brush_import: {  }
    end

    assert_redirected_to carbon_brush_import_path(assigns(:carbon_brush_import))
  end

  test "should show carbon_brush_import" do
    get :show, id: @carbon_brush_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @carbon_brush_import
    assert_response :success
  end

  test "should update carbon_brush_import" do
    patch :update, id: @carbon_brush_import, carbon_brush_import: {  }
    assert_redirected_to carbon_brush_import_path(assigns(:carbon_brush_import))
  end

  test "should destroy carbon_brush_import" do
    assert_difference('CarbonBrushImport.count', -1) do
      delete :destroy, id: @carbon_brush_import
    end

    assert_redirected_to carbon_brush_imports_path
  end
end
