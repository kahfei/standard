require 'test_helper'

class WashersControllerTest < ActionController::TestCase
  setup do
    @washer = washers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:washers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create washer" do
    assert_difference('Washer.count') do
      post :create, washer: { coating: @washer.coating, description: @washer.description, drawing_norm: @washer.drawing_norm, inner_diameter: @washer.inner_diameter, material: @washer.material, need_to_edit_coating: @washer.need_to_edit_coating, need_to_edit_description: @washer.need_to_edit_description, need_to_edit_drawing_norm: @washer.need_to_edit_drawing_norm, need_to_edit_inner_diameter: @washer.need_to_edit_inner_diameter, need_to_edit_material: @washer.need_to_edit_material, need_to_edit_outer_diameter: @washer.need_to_edit_outer_diameter, need_to_edit_partnumber: @washer.need_to_edit_partnumber, need_to_edit_remark: @washer.need_to_edit_remark, need_to_edit_thickness: @washer.need_to_edit_thickness, need_to_edit_washer_type: @washer.need_to_edit_washer_type, need_to_edit_where_used_plant: @washer.need_to_edit_where_used_plant, need_to_edit_where_used_product: @washer.need_to_edit_where_used_product, outer_diameter: @washer.outer_diameter, partnumber: @washer.partnumber, release_status: @washer.release_status, remark: @washer.remark, thickness: @washer.thickness, uploaded_by_section: @washer.uploaded_by_section, uploader_name: @washer.uploader_name, uploader_role: @washer.uploader_role, washer_type: @washer.washer_type, where_used_plant: @washer.where_used_plant, where_used_product: @washer.where_used_product }
    end

    assert_redirected_to washer_path(assigns(:washer))
  end

  test "should show washer" do
    get :show, id: @washer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @washer
    assert_response :success
  end

  test "should update washer" do
    patch :update, id: @washer, washer: { coating: @washer.coating, description: @washer.description, drawing_norm: @washer.drawing_norm, inner_diameter: @washer.inner_diameter, material: @washer.material, need_to_edit_coating: @washer.need_to_edit_coating, need_to_edit_description: @washer.need_to_edit_description, need_to_edit_drawing_norm: @washer.need_to_edit_drawing_norm, need_to_edit_inner_diameter: @washer.need_to_edit_inner_diameter, need_to_edit_material: @washer.need_to_edit_material, need_to_edit_outer_diameter: @washer.need_to_edit_outer_diameter, need_to_edit_partnumber: @washer.need_to_edit_partnumber, need_to_edit_remark: @washer.need_to_edit_remark, need_to_edit_thickness: @washer.need_to_edit_thickness, need_to_edit_washer_type: @washer.need_to_edit_washer_type, need_to_edit_where_used_plant: @washer.need_to_edit_where_used_plant, need_to_edit_where_used_product: @washer.need_to_edit_where_used_product, outer_diameter: @washer.outer_diameter, partnumber: @washer.partnumber, release_status: @washer.release_status, remark: @washer.remark, thickness: @washer.thickness, uploaded_by_section: @washer.uploaded_by_section, uploader_name: @washer.uploader_name, uploader_role: @washer.uploader_role, washer_type: @washer.washer_type, where_used_plant: @washer.where_used_plant, where_used_product: @washer.where_used_product }
    assert_redirected_to washer_path(assigns(:washer))
  end

  test "should destroy washer" do
    assert_difference('Washer.count', -1) do
      delete :destroy, id: @washer
    end

    assert_redirected_to washers_path
  end
end
