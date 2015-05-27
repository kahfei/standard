require 'test_helper'

class BearingImportsControllerTest < ActionController::TestCase
  setup do
    @bearing_import = bearing_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bearing_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bearing_import" do
    assert_difference('BearingImport.count') do
      post :create, bearing_import: {  }
    end

    assert_redirected_to bearing_import_path(assigns(:bearing_import))
  end

  test "should show bearing_import" do
    get :show, id: @bearing_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bearing_import
    assert_response :success
  end

  test "should update bearing_import" do
    patch :update, id: @bearing_import, bearing_import: {  }
    assert_redirected_to bearing_import_path(assigns(:bearing_import))
  end

  test "should destroy bearing_import" do
    assert_difference('BearingImport.count', -1) do
      delete :destroy, id: @bearing_import
    end

    assert_redirected_to bearing_imports_path
  end
end
