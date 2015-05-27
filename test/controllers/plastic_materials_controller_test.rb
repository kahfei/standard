require 'test_helper'

class PlasticMaterialsControllerTest < ActionController::TestCase
  setup do
    @plastic_material = plastic_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plastic_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plastic_material" do
    assert_difference('PlasticMaterial.count') do
      post :create, plastic_material: { color: @plastic_material.color, drawing_norm: @plastic_material.drawing_norm, need_to_edit_color: @plastic_material.need_to_edit_color, need_to_edit_drawing_norm: @plastic_material.need_to_edit_drawing_norm, need_to_edit_partnumber: @plastic_material.need_to_edit_partnumber, need_to_edit_recommendation: @plastic_material.need_to_edit_recommendation, need_to_edit_related_molders: @plastic_material.need_to_edit_related_molders, need_to_edit_resin: @plastic_material.need_to_edit_resin, need_to_edit_supplier: @plastic_material.need_to_edit_supplier, need_to_edit_supplier_material_info: @plastic_material.need_to_edit_supplier_material_info, need_to_edit_ul_number: @plastic_material.need_to_edit_ul_number, need_to_edit_where_used_product: @plastic_material.need_to_edit_where_used_product, partnumber: @plastic_material.partnumber, recommendation: @plastic_material.recommendation, related_molders: @plastic_material.related_molders, release_status: @plastic_material.release_status, resin: @plastic_material.resin, supplier: @plastic_material.supplier, supplier_material_info: @plastic_material.supplier_material_info, ul_number: @plastic_material.ul_number, uploaded_by_section: @plastic_material.uploaded_by_section, uploader_name: @plastic_material.uploader_name, uploader_role: @plastic_material.uploader_role, where_used_product: @plastic_material.where_used_product }
    end

    assert_redirected_to plastic_material_path(assigns(:plastic_material))
  end

  test "should show plastic_material" do
    get :show, id: @plastic_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plastic_material
    assert_response :success
  end

  test "should update plastic_material" do
    patch :update, id: @plastic_material, plastic_material: { color: @plastic_material.color, drawing_norm: @plastic_material.drawing_norm, need_to_edit_color: @plastic_material.need_to_edit_color, need_to_edit_drawing_norm: @plastic_material.need_to_edit_drawing_norm, need_to_edit_partnumber: @plastic_material.need_to_edit_partnumber, need_to_edit_recommendation: @plastic_material.need_to_edit_recommendation, need_to_edit_related_molders: @plastic_material.need_to_edit_related_molders, need_to_edit_resin: @plastic_material.need_to_edit_resin, need_to_edit_supplier: @plastic_material.need_to_edit_supplier, need_to_edit_supplier_material_info: @plastic_material.need_to_edit_supplier_material_info, need_to_edit_ul_number: @plastic_material.need_to_edit_ul_number, need_to_edit_where_used_product: @plastic_material.need_to_edit_where_used_product, partnumber: @plastic_material.partnumber, recommendation: @plastic_material.recommendation, related_molders: @plastic_material.related_molders, release_status: @plastic_material.release_status, resin: @plastic_material.resin, supplier: @plastic_material.supplier, supplier_material_info: @plastic_material.supplier_material_info, ul_number: @plastic_material.ul_number, uploaded_by_section: @plastic_material.uploaded_by_section, uploader_name: @plastic_material.uploader_name, uploader_role: @plastic_material.uploader_role, where_used_product: @plastic_material.where_used_product }
    assert_redirected_to plastic_material_path(assigns(:plastic_material))
  end

  test "should destroy plastic_material" do
    assert_difference('PlasticMaterial.count', -1) do
      delete :destroy, id: @plastic_material
    end

    assert_redirected_to plastic_materials_path
  end
end
