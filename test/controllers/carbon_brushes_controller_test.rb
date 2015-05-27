require 'test_helper'

class CarbonBrushesControllerTest < ActionController::TestCase
  setup do
    @carbon_brush = carbon_brushes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carbon_brushes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create carbon_brush" do
    assert_difference('CarbonBrush.count') do
      post :create, carbon_brush: { components: @carbon_brush.components, cross_sec: @carbon_brush.cross_sec, cut_off: @carbon_brush.cut_off, description: @carbon_brush.description, drawing_norm: @carbon_brush.drawing_norm, length: @carbon_brush.length, need_to_edit_components: @carbon_brush.need_to_edit_components, need_to_edit_cross_sec: @carbon_brush.need_to_edit_cross_sec, need_to_edit_cut_off: @carbon_brush.need_to_edit_cut_off, need_to_edit_description: @carbon_brush.need_to_edit_description, need_to_edit_drawing_norm: @carbon_brush.need_to_edit_drawing_norm, need_to_edit_length: @carbon_brush.need_to_edit_length, need_to_edit_partnumber: @carbon_brush.need_to_edit_partnumber, need_to_edit_radius_for_commutator_mm: @carbon_brush.need_to_edit_radius_for_commutator_mm, need_to_edit_remark: @carbon_brush.need_to_edit_remark, need_to_edit_supplier: @carbon_brush.need_to_edit_supplier, need_to_edit_where_used_plant: @carbon_brush.need_to_edit_where_used_plant, need_to_edit_where_used_product: @carbon_brush.need_to_edit_where_used_product, need_to_edit_wire_length_or_spring_free_length: @carbon_brush.need_to_edit_wire_length_or_spring_free_length, partnumber: @carbon_brush.partnumber, radius_for_commutator_mm: @carbon_brush.radius_for_commutator_mm, release_status: @carbon_brush.release_status, remark: @carbon_brush.remark, supplier: @carbon_brush.supplier, uploaded_by_section: @carbon_brush.uploaded_by_section, uploader_name: @carbon_brush.uploader_name, uploader_role: @carbon_brush.uploader_role, where_used_plant: @carbon_brush.where_used_plant, where_used_product: @carbon_brush.where_used_product, wire_length_or_spring_free_length: @carbon_brush.wire_length_or_spring_free_length }
    end

    assert_redirected_to carbon_brush_path(assigns(:carbon_brush))
  end

  test "should show carbon_brush" do
    get :show, id: @carbon_brush
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @carbon_brush
    assert_response :success
  end

  test "should update carbon_brush" do
    patch :update, id: @carbon_brush, carbon_brush: { components: @carbon_brush.components, cross_sec: @carbon_brush.cross_sec, cut_off: @carbon_brush.cut_off, description: @carbon_brush.description, drawing_norm: @carbon_brush.drawing_norm, length: @carbon_brush.length, need_to_edit_components: @carbon_brush.need_to_edit_components, need_to_edit_cross_sec: @carbon_brush.need_to_edit_cross_sec, need_to_edit_cut_off: @carbon_brush.need_to_edit_cut_off, need_to_edit_description: @carbon_brush.need_to_edit_description, need_to_edit_drawing_norm: @carbon_brush.need_to_edit_drawing_norm, need_to_edit_length: @carbon_brush.need_to_edit_length, need_to_edit_partnumber: @carbon_brush.need_to_edit_partnumber, need_to_edit_radius_for_commutator_mm: @carbon_brush.need_to_edit_radius_for_commutator_mm, need_to_edit_remark: @carbon_brush.need_to_edit_remark, need_to_edit_supplier: @carbon_brush.need_to_edit_supplier, need_to_edit_where_used_plant: @carbon_brush.need_to_edit_where_used_plant, need_to_edit_where_used_product: @carbon_brush.need_to_edit_where_used_product, need_to_edit_wire_length_or_spring_free_length: @carbon_brush.need_to_edit_wire_length_or_spring_free_length, partnumber: @carbon_brush.partnumber, radius_for_commutator_mm: @carbon_brush.radius_for_commutator_mm, release_status: @carbon_brush.release_status, remark: @carbon_brush.remark, supplier: @carbon_brush.supplier, uploaded_by_section: @carbon_brush.uploaded_by_section, uploader_name: @carbon_brush.uploader_name, uploader_role: @carbon_brush.uploader_role, where_used_plant: @carbon_brush.where_used_plant, where_used_product: @carbon_brush.where_used_product, wire_length_or_spring_free_length: @carbon_brush.wire_length_or_spring_free_length }
    assert_redirected_to carbon_brush_path(assigns(:carbon_brush))
  end

  test "should destroy carbon_brush" do
    assert_difference('CarbonBrush.count', -1) do
      delete :destroy, id: @carbon_brush
    end

    assert_redirected_to carbon_brushes_path
  end
end
