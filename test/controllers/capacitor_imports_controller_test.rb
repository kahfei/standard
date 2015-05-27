require 'test_helper'

class CapacitorImportsControllerTest < ActionController::TestCase
  setup do
    @capacitor_import = capacitor_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:capacitor_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create capacitor_import" do
    assert_difference('CapacitorImport.count') do
      post :create, capacitor_import: { create: @capacitor_import.create, new: @capacitor_import.new }
    end

    assert_redirected_to capacitor_import_path(assigns(:capacitor_import))
  end

  test "should show capacitor_import" do
    get :show, id: @capacitor_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @capacitor_import
    assert_response :success
  end

  test "should update capacitor_import" do
    patch :update, id: @capacitor_import, capacitor_import: { create: @capacitor_import.create, new: @capacitor_import.new }
    assert_redirected_to capacitor_import_path(assigns(:capacitor_import))
  end

  test "should destroy capacitor_import" do
    assert_difference('CapacitorImport.count', -1) do
      delete :destroy, id: @capacitor_import
    end

    assert_redirected_to capacitor_imports_path
  end
end
