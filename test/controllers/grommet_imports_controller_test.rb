require 'test_helper'

class GrommetImportsControllerTest < ActionController::TestCase
  setup do
    @grommet_import = grommet_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grommet_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grommet_import" do
    assert_difference('GrommetImport.count') do
      post :create, grommet_import: {  }
    end

    assert_redirected_to grommet_import_path(assigns(:grommet_import))
  end

  test "should show grommet_import" do
    get :show, id: @grommet_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grommet_import
    assert_response :success
  end

  test "should update grommet_import" do
    patch :update, id: @grommet_import, grommet_import: {  }
    assert_redirected_to grommet_import_path(assigns(:grommet_import))
  end

  test "should destroy grommet_import" do
    assert_difference('GrommetImport.count', -1) do
      delete :destroy, id: @grommet_import
    end

    assert_redirected_to grommet_imports_path
  end
end
