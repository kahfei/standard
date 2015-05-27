require 'test_helper'

class SpiralSpringsControllerTest < ActionController::TestCase
  setup do
    @spiral_spring = spiral_springs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spiral_springs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spiral_spring" do
    assert_difference('SpiralSpring.count') do
      post :create, spiral_spring: { description: @spiral_spring.description, drawing_norm: @spiral_spring.drawing_norm, final_force: @spiral_spring.final_force, initial_force: @spiral_spring.initial_force, material_thickness: @spiral_spring.material_thickness, material_width: @spiral_spring.material_width, need_to_edit_description: @spiral_spring.need_to_edit_description, need_to_edit_drawing_norm: @spiral_spring.need_to_edit_drawing_norm, need_to_edit_final_force: @spiral_spring.need_to_edit_final_force, need_to_edit_initial_force: @spiral_spring.need_to_edit_initial_force, need_to_edit_material_thickness: @spiral_spring.need_to_edit_material_thickness, need_to_edit_material_width: @spiral_spring.need_to_edit_material_width, need_to_edit_outer_dia: @spiral_spring.need_to_edit_outer_dia, need_to_edit_partnumber: @spiral_spring.need_to_edit_partnumber, need_to_edit_supplier: @spiral_spring.need_to_edit_supplier, need_to_edit_torsion_arm_length: @spiral_spring.need_to_edit_torsion_arm_length, need_to_edit_torsion_arm_movable_distance: @spiral_spring.need_to_edit_torsion_arm_movable_distance, need_to_edit_where_used_plant: @spiral_spring.need_to_edit_where_used_plant, need_to_edit_where_used_product: @spiral_spring.need_to_edit_where_used_product, outer_dia: @spiral_spring.outer_dia, partnumber: @spiral_spring.partnumber, release_status: @spiral_spring.release_status, supplier: @spiral_spring.supplier, torsion_arm_length: @spiral_spring.torsion_arm_length, torsion_arm_movable_distance: @spiral_spring.torsion_arm_movable_distance, uploaded_by_section: @spiral_spring.uploaded_by_section, uploader_name: @spiral_spring.uploader_name, uploader_role: @spiral_spring.uploader_role, where_used_plant: @spiral_spring.where_used_plant, where_used_product: @spiral_spring.where_used_product }
    end

    assert_redirected_to spiral_spring_path(assigns(:spiral_spring))
  end

  test "should show spiral_spring" do
    get :show, id: @spiral_spring
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spiral_spring
    assert_response :success
  end

  test "should update spiral_spring" do
    patch :update, id: @spiral_spring, spiral_spring: { description: @spiral_spring.description, drawing_norm: @spiral_spring.drawing_norm, final_force: @spiral_spring.final_force, initial_force: @spiral_spring.initial_force, material_thickness: @spiral_spring.material_thickness, material_width: @spiral_spring.material_width, need_to_edit_description: @spiral_spring.need_to_edit_description, need_to_edit_drawing_norm: @spiral_spring.need_to_edit_drawing_norm, need_to_edit_final_force: @spiral_spring.need_to_edit_final_force, need_to_edit_initial_force: @spiral_spring.need_to_edit_initial_force, need_to_edit_material_thickness: @spiral_spring.need_to_edit_material_thickness, need_to_edit_material_width: @spiral_spring.need_to_edit_material_width, need_to_edit_outer_dia: @spiral_spring.need_to_edit_outer_dia, need_to_edit_partnumber: @spiral_spring.need_to_edit_partnumber, need_to_edit_supplier: @spiral_spring.need_to_edit_supplier, need_to_edit_torsion_arm_length: @spiral_spring.need_to_edit_torsion_arm_length, need_to_edit_torsion_arm_movable_distance: @spiral_spring.need_to_edit_torsion_arm_movable_distance, need_to_edit_where_used_plant: @spiral_spring.need_to_edit_where_used_plant, need_to_edit_where_used_product: @spiral_spring.need_to_edit_where_used_product, outer_dia: @spiral_spring.outer_dia, partnumber: @spiral_spring.partnumber, release_status: @spiral_spring.release_status, supplier: @spiral_spring.supplier, torsion_arm_length: @spiral_spring.torsion_arm_length, torsion_arm_movable_distance: @spiral_spring.torsion_arm_movable_distance, uploaded_by_section: @spiral_spring.uploaded_by_section, uploader_name: @spiral_spring.uploader_name, uploader_role: @spiral_spring.uploader_role, where_used_plant: @spiral_spring.where_used_plant, where_used_product: @spiral_spring.where_used_product }
    assert_redirected_to spiral_spring_path(assigns(:spiral_spring))
  end

  test "should destroy spiral_spring" do
    assert_difference('SpiralSpring.count', -1) do
      delete :destroy, id: @spiral_spring
    end

    assert_redirected_to spiral_springs_path
  end
end
