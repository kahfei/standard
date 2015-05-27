require 'test_helper'

class WasherImportsControllerTest < ActionController::TestCase
  setup do
    @washer_import = washer_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:washer_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create washer_import" do
    assert_difference('WasherImport.count') do
      post :create, washer_import: {  }
    end

    assert_redirected_to washer_import_path(assigns(:washer_import))
  end

  test "should show washer_import" do
    get :show, id: @washer_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @washer_import
    assert_response :success
  end

  test "should update washer_import" do
    patch :update, id: @washer_import, washer_import: {  }
    assert_redirected_to washer_import_path(assigns(:washer_import))
  end

  test "should destroy washer_import" do
    assert_difference('WasherImport.count', -1) do
      delete :destroy, id: @washer_import
    end

    assert_redirected_to washer_imports_path
  end
end
