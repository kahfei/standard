require 'test_helper'

class GrommetsControllerTest < ActionController::TestCase
  setup do
    @grommet = grommets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grommets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grommet" do
    assert_difference('Grommet.count') do
      post :create, grommet: { description: @grommet.description, drawing_norm: @grommet.drawing_norm, for_cord_od: @grommet.for_cord_od, grommet_type: @grommet.grommet_type, inner_hole_diameter: @grommet.inner_hole_diameter, length: @grommet.length, material: @grommet.material, need_to_edit_description: @grommet.need_to_edit_description, need_to_edit_drawing_norm: @grommet.need_to_edit_drawing_norm, need_to_edit_for_cord_od: @grommet.need_to_edit_for_cord_od, need_to_edit_grommet_type: @grommet.need_to_edit_grommet_type, need_to_edit_inner_hole_diameter: @grommet.need_to_edit_inner_hole_diameter, need_to_edit_length: @grommet.need_to_edit_length, need_to_edit_material: @grommet.need_to_edit_material, need_to_edit_partnumber: @grommet.need_to_edit_partnumber, need_to_edit_remark: @grommet.need_to_edit_remark, need_to_edit_where_used_plant: @grommet.need_to_edit_where_used_plant, need_to_edit_where_used_product: @grommet.need_to_edit_where_used_product, partnumber: @grommet.partnumber, release_status: @grommet.release_status, remark: @grommet.remark, uploaded_by_section: @grommet.uploaded_by_section, uploader_name: @grommet.uploader_name, uploader_role: @grommet.uploader_role, where_used_plant: @grommet.where_used_plant, where_used_product: @grommet.where_used_product }
    end

    assert_redirected_to grommet_path(assigns(:grommet))
  end

  test "should show grommet" do
    get :show, id: @grommet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grommet
    assert_response :success
  end

  test "should update grommet" do
    patch :update, id: @grommet, grommet: { description: @grommet.description, drawing_norm: @grommet.drawing_norm, for_cord_od: @grommet.for_cord_od, grommet_type: @grommet.grommet_type, inner_hole_diameter: @grommet.inner_hole_diameter, length: @grommet.length, material: @grommet.material, need_to_edit_description: @grommet.need_to_edit_description, need_to_edit_drawing_norm: @grommet.need_to_edit_drawing_norm, need_to_edit_for_cord_od: @grommet.need_to_edit_for_cord_od, need_to_edit_grommet_type: @grommet.need_to_edit_grommet_type, need_to_edit_inner_hole_diameter: @grommet.need_to_edit_inner_hole_diameter, need_to_edit_length: @grommet.need_to_edit_length, need_to_edit_material: @grommet.need_to_edit_material, need_to_edit_partnumber: @grommet.need_to_edit_partnumber, need_to_edit_remark: @grommet.need_to_edit_remark, need_to_edit_where_used_plant: @grommet.need_to_edit_where_used_plant, need_to_edit_where_used_product: @grommet.need_to_edit_where_used_product, partnumber: @grommet.partnumber, release_status: @grommet.release_status, remark: @grommet.remark, uploaded_by_section: @grommet.uploaded_by_section, uploader_name: @grommet.uploader_name, uploader_role: @grommet.uploader_role, where_used_plant: @grommet.where_used_plant, where_used_product: @grommet.where_used_product }
    assert_redirected_to grommet_path(assigns(:grommet))
  end

  test "should destroy grommet" do
    assert_difference('Grommet.count', -1) do
      delete :destroy, id: @grommet
    end

    assert_redirected_to grommets_path
  end
end
