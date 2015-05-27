require 'test_helper'

class SpringsControllerTest < ActionController::TestCase
  setup do
    @spring = springs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:springs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spring" do
    assert_difference('Spring.count') do
      post :create, spring: { description: @spring.description, dimension_f1: @spring.dimension_f1, dimension_f2: @spring.dimension_f2, dimension_l1: @spring.dimension_l1, dimension_l2: @spring.dimension_l2, drawing_norm: @spring.drawing_norm, final_load_nm: @spring.final_load_nm, free_length: @spring.free_length, hook_arc_radius: @spring.hook_arc_radius, hook_length: @spring.hook_length, initial_load_nm: @spring.initial_load_nm, material_dia: @spring.material_dia, mean_dia: @spring.mean_dia, need_to_edit_description: @spring.need_to_edit_description, need_to_edit_dimension_f1: @spring.need_to_edit_dimension_f1, need_to_edit_dimension_f2: @spring.need_to_edit_dimension_f2, need_to_edit_dimension_l1: @spring.need_to_edit_dimension_l1, need_to_edit_dimension_l2: @spring.need_to_edit_dimension_l2, need_to_edit_drawing_norm: @spring.need_to_edit_drawing_norm, need_to_edit_final_load_nm: @spring.need_to_edit_final_load_nm, need_to_edit_free_length: @spring.need_to_edit_free_length, need_to_edit_hook_arc_radius: @spring.need_to_edit_hook_arc_radius, need_to_edit_hook_length: @spring.need_to_edit_hook_length, need_to_edit_initial_load_nm: @spring.need_to_edit_initial_load_nm, need_to_edit_material_dia: @spring.need_to_edit_material_dia, need_to_edit_mean_dia: @spring.need_to_edit_mean_dia, need_to_edit_no_of_active_coils: @spring.need_to_edit_no_of_active_coils, need_to_edit_partnumber: @spring.need_to_edit_partnumber, need_to_edit_remark: @spring.need_to_edit_remark, need_to_edit_solid_length_max: @spring.need_to_edit_solid_length_max, need_to_edit_spring_constant: @spring.need_to_edit_spring_constant, need_to_edit_spring_type: @spring.need_to_edit_spring_type, need_to_edit_supplier: @spring.need_to_edit_supplier, need_to_edit_torque_arm_length: @spring.need_to_edit_torque_arm_length, need_to_edit_unit: @spring.need_to_edit_unit, need_to_edit_where_used_plant: @spring.need_to_edit_where_used_plant, need_to_edit_where_used_product: @spring.need_to_edit_where_used_product, no_of_active_coils: @spring.no_of_active_coils, partnumber: @spring.partnumber, release_status: @spring.release_status, remark: @spring.remark, solid_length_max: @spring.solid_length_max, spring_constant: @spring.spring_constant, spring_type: @spring.spring_type, supplier: @spring.supplier, torque_arm_length: @spring.torque_arm_length, unit: @spring.unit, uploaded_by_section: @spring.uploaded_by_section, uploader_name: @spring.uploader_name, uploader_role: @spring.uploader_role, where_used_plant: @spring.where_used_plant, where_used_product: @spring.where_used_product }
    end

    assert_redirected_to spring_path(assigns(:spring))
  end

  test "should show spring" do
    get :show, id: @spring
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spring
    assert_response :success
  end

  test "should update spring" do
    patch :update, id: @spring, spring: { description: @spring.description, dimension_f1: @spring.dimension_f1, dimension_f2: @spring.dimension_f2, dimension_l1: @spring.dimension_l1, dimension_l2: @spring.dimension_l2, drawing_norm: @spring.drawing_norm, final_load_nm: @spring.final_load_nm, free_length: @spring.free_length, hook_arc_radius: @spring.hook_arc_radius, hook_length: @spring.hook_length, initial_load_nm: @spring.initial_load_nm, material_dia: @spring.material_dia, mean_dia: @spring.mean_dia, need_to_edit_description: @spring.need_to_edit_description, need_to_edit_dimension_f1: @spring.need_to_edit_dimension_f1, need_to_edit_dimension_f2: @spring.need_to_edit_dimension_f2, need_to_edit_dimension_l1: @spring.need_to_edit_dimension_l1, need_to_edit_dimension_l2: @spring.need_to_edit_dimension_l2, need_to_edit_drawing_norm: @spring.need_to_edit_drawing_norm, need_to_edit_final_load_nm: @spring.need_to_edit_final_load_nm, need_to_edit_free_length: @spring.need_to_edit_free_length, need_to_edit_hook_arc_radius: @spring.need_to_edit_hook_arc_radius, need_to_edit_hook_length: @spring.need_to_edit_hook_length, need_to_edit_initial_load_nm: @spring.need_to_edit_initial_load_nm, need_to_edit_material_dia: @spring.need_to_edit_material_dia, need_to_edit_mean_dia: @spring.need_to_edit_mean_dia, need_to_edit_no_of_active_coils: @spring.need_to_edit_no_of_active_coils, need_to_edit_partnumber: @spring.need_to_edit_partnumber, need_to_edit_remark: @spring.need_to_edit_remark, need_to_edit_solid_length_max: @spring.need_to_edit_solid_length_max, need_to_edit_spring_constant: @spring.need_to_edit_spring_constant, need_to_edit_spring_type: @spring.need_to_edit_spring_type, need_to_edit_supplier: @spring.need_to_edit_supplier, need_to_edit_torque_arm_length: @spring.need_to_edit_torque_arm_length, need_to_edit_unit: @spring.need_to_edit_unit, need_to_edit_where_used_plant: @spring.need_to_edit_where_used_plant, need_to_edit_where_used_product: @spring.need_to_edit_where_used_product, no_of_active_coils: @spring.no_of_active_coils, partnumber: @spring.partnumber, release_status: @spring.release_status, remark: @spring.remark, solid_length_max: @spring.solid_length_max, spring_constant: @spring.spring_constant, spring_type: @spring.spring_type, supplier: @spring.supplier, torque_arm_length: @spring.torque_arm_length, unit: @spring.unit, uploaded_by_section: @spring.uploaded_by_section, uploader_name: @spring.uploader_name, uploader_role: @spring.uploader_role, where_used_plant: @spring.where_used_plant, where_used_product: @spring.where_used_product }
    assert_redirected_to spring_path(assigns(:spring))
  end

  test "should destroy spring" do
    assert_difference('Spring.count', -1) do
      delete :destroy, id: @spring
    end

    assert_redirected_to springs_path
  end
end
