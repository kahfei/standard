require 'test_helper'

class PlasticMaterialImportsControllerTest < ActionController::TestCase
  setup do
    @plastic_material_import = plastic_material_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plastic_material_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plastic_material_import" do
    assert_difference('PlasticMaterialImport.count') do
      post :create, plastic_material_import: {  }
    end

    assert_redirected_to plastic_material_import_path(assigns(:plastic_material_import))
  end

  test "should show plastic_material_import" do
    get :show, id: @plastic_material_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plastic_material_import
    assert_response :success
  end

  test "should update plastic_material_import" do
    patch :update, id: @plastic_material_import, plastic_material_import: {  }
    assert_redirected_to plastic_material_import_path(assigns(:plastic_material_import))
  end

  test "should destroy plastic_material_import" do
    assert_difference('PlasticMaterialImport.count', -1) do
      delete :destroy, id: @plastic_material_import
    end

    assert_redirected_to plastic_material_imports_path
  end
end
