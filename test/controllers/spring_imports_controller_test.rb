require 'test_helper'

class SpringImportsControllerTest < ActionController::TestCase
  setup do
    @spring_import = spring_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spring_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spring_import" do
    assert_difference('SpringImport.count') do
      post :create, spring_import: {  }
    end

    assert_redirected_to spring_import_path(assigns(:spring_import))
  end

  test "should show spring_import" do
    get :show, id: @spring_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spring_import
    assert_response :success
  end

  test "should update spring_import" do
    patch :update, id: @spring_import, spring_import: {  }
    assert_redirected_to spring_import_path(assigns(:spring_import))
  end

  test "should destroy spring_import" do
    assert_difference('SpringImport.count', -1) do
      delete :destroy, id: @spring_import
    end

    assert_redirected_to spring_imports_path
  end
end
