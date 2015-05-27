require 'test_helper'

class ScrewImportsControllerTest < ActionController::TestCase
  setup do
    @screw_import = screw_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:screw_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create screw_import" do
    assert_difference('ScrewImport.count') do
      post :create, screw_import: {  }
    end

    assert_redirected_to screw_import_path(assigns(:screw_import))
  end

  test "should show screw_import" do
    get :show, id: @screw_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @screw_import
    assert_response :success
  end

  test "should update screw_import" do
    patch :update, id: @screw_import, screw_import: {  }
    assert_redirected_to screw_import_path(assigns(:screw_import))
  end

  test "should destroy screw_import" do
    assert_difference('ScrewImport.count', -1) do
      delete :destroy, id: @screw_import
    end

    assert_redirected_to screw_imports_path
  end
end
