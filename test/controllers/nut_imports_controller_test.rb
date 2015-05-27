require 'test_helper'

class NutImportsControllerTest < ActionController::TestCase
  setup do
    @nut_import = nut_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nut_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nut_import" do
    assert_difference('NutImport.count') do
      post :create, nut_import: {  }
    end

    assert_redirected_to nut_import_path(assigns(:nut_import))
  end

  test "should show nut_import" do
    get :show, id: @nut_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nut_import
    assert_response :success
  end

  test "should update nut_import" do
    patch :update, id: @nut_import, nut_import: {  }
    assert_redirected_to nut_import_path(assigns(:nut_import))
  end

  test "should destroy nut_import" do
    assert_difference('NutImport.count', -1) do
      delete :destroy, id: @nut_import
    end

    assert_redirected_to nut_imports_path
  end
end
