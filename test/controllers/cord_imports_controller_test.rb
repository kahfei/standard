require 'test_helper'

class CordImportsControllerTest < ActionController::TestCase
  setup do
    @cord_import = cord_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cord_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cord_import" do
    assert_difference('CordImport.count') do
      post :create, cord_import: {  }
    end

    assert_redirected_to cord_import_path(assigns(:cord_import))
  end

  test "should show cord_import" do
    get :show, id: @cord_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cord_import
    assert_response :success
  end

  test "should update cord_import" do
    patch :update, id: @cord_import, cord_import: {  }
    assert_redirected_to cord_import_path(assigns(:cord_import))
  end

  test "should destroy cord_import" do
    assert_difference('CordImport.count', -1) do
      delete :destroy, id: @cord_import
    end

    assert_redirected_to cord_imports_path
  end
end
