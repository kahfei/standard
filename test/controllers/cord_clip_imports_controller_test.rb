require 'test_helper'

class CordClipImportsControllerTest < ActionController::TestCase
  setup do
    @cord_clip_import = cord_clip_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cord_clip_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cord_clip_import" do
    assert_difference('CordClipImport.count') do
      post :create, cord_clip_import: {  }
    end

    assert_redirected_to cord_clip_import_path(assigns(:cord_clip_import))
  end

  test "should show cord_clip_import" do
    get :show, id: @cord_clip_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cord_clip_import
    assert_response :success
  end

  test "should update cord_clip_import" do
    patch :update, id: @cord_clip_import, cord_clip_import: {  }
    assert_redirected_to cord_clip_import_path(assigns(:cord_clip_import))
  end

  test "should destroy cord_clip_import" do
    assert_difference('CordClipImport.count', -1) do
      delete :destroy, id: @cord_clip_import
    end

    assert_redirected_to cord_clip_imports_path
  end
end
