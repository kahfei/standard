require 'test_helper'

class CClipImportsControllerTest < ActionController::TestCase
  setup do
    @c_clip_import = c_clip_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:c_clip_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create c_clip_import" do
    assert_difference('CClipImport.count') do
      post :create, c_clip_import: {  }
    end

    assert_redirected_to c_clip_import_path(assigns(:c_clip_import))
  end

  test "should show c_clip_import" do
    get :show, id: @c_clip_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @c_clip_import
    assert_response :success
  end

  test "should update c_clip_import" do
    patch :update, id: @c_clip_import, c_clip_import: {  }
    assert_redirected_to c_clip_import_path(assigns(:c_clip_import))
  end

  test "should destroy c_clip_import" do
    assert_difference('CClipImport.count', -1) do
      delete :destroy, id: @c_clip_import
    end

    assert_redirected_to c_clip_imports_path
  end
end
