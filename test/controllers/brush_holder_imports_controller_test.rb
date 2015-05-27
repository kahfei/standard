require 'test_helper'

class BrushHolderImportsControllerTest < ActionController::TestCase
  setup do
    @brush_holder_import = brush_holder_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brush_holder_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brush_holder_import" do
    assert_difference('BrushHolderImport.count') do
      post :create, brush_holder_import: {  }
    end

    assert_redirected_to brush_holder_import_path(assigns(:brush_holder_import))
  end

  test "should show brush_holder_import" do
    get :show, id: @brush_holder_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @brush_holder_import
    assert_response :success
  end

  test "should update brush_holder_import" do
    patch :update, id: @brush_holder_import, brush_holder_import: {  }
    assert_redirected_to brush_holder_import_path(assigns(:brush_holder_import))
  end

  test "should destroy brush_holder_import" do
    assert_difference('BrushHolderImport.count', -1) do
      delete :destroy, id: @brush_holder_import
    end

    assert_redirected_to brush_holder_imports_path
  end
end
