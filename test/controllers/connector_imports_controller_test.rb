require 'test_helper'

class ConnectorImportsControllerTest < ActionController::TestCase
  setup do
    @connector_import = connector_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:connector_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create connector_import" do
    assert_difference('ConnectorImport.count') do
      post :create, connector_import: {  }
    end

    assert_redirected_to connector_import_path(assigns(:connector_import))
  end

  test "should show connector_import" do
    get :show, id: @connector_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @connector_import
    assert_response :success
  end

  test "should update connector_import" do
    patch :update, id: @connector_import, connector_import: {  }
    assert_redirected_to connector_import_path(assigns(:connector_import))
  end

  test "should destroy connector_import" do
    assert_difference('ConnectorImport.count', -1) do
      delete :destroy, id: @connector_import
    end

    assert_redirected_to connector_imports_path
  end
end
