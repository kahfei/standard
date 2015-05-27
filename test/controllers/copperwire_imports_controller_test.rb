require 'test_helper'

class CopperwireImportsControllerTest < ActionController::TestCase
  setup do
    @copperwire_import = copperwire_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:copperwire_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create copperwire_import" do
    assert_difference('CopperwireImport.count') do
      post :create, copperwire_import: {  }
    end

    assert_redirected_to copperwire_import_path(assigns(:copperwire_import))
  end

  test "should show copperwire_import" do
    get :show, id: @copperwire_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @copperwire_import
    assert_response :success
  end

  test "should update copperwire_import" do
    patch :update, id: @copperwire_import, copperwire_import: {  }
    assert_redirected_to copperwire_import_path(assigns(:copperwire_import))
  end

  test "should destroy copperwire_import" do
    assert_difference('CopperwireImport.count', -1) do
      delete :destroy, id: @copperwire_import
    end

    assert_redirected_to copperwire_imports_path
  end
end
