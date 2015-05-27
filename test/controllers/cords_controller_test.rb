require 'test_helper'

class CordsControllerTest < ActionController::TestCase
  setup do
    @cord = cords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cord" do
    assert_difference('Cord.count') do
      post :create, cord: { cord_mat: @cord.cord_mat, cord_od: @cord.cord_od, cord_spec: @cord.cord_spec, cord_type: @cord.cord_type, cross_sec: @cord.cross_sec, description: @cord.description, dismantled_length: @cord.dismantled_length, drawing_norm: @cord.drawing_norm, length: @cord.length, need_to_edit_cord_mat: @cord.need_to_edit_cord_mat, need_to_edit_cord_od: @cord.need_to_edit_cord_od, need_to_edit_cord_spec: @cord.need_to_edit_cord_spec, need_to_edit_cord_type: @cord.need_to_edit_cord_type, need_to_edit_cross_sec: @cord.need_to_edit_cross_sec, need_to_edit_description: @cord.need_to_edit_description, need_to_edit_dismantled_length: @cord.need_to_edit_dismantled_length, need_to_edit_drawing_norm: @cord.need_to_edit_drawing_norm, need_to_edit_length: @cord.need_to_edit_length, need_to_edit_partnumber: @cord.need_to_edit_partnumber, need_to_edit_plug_type: @cord.need_to_edit_plug_type, need_to_edit_polarity: @cord.need_to_edit_polarity, need_to_edit_remark: @cord.need_to_edit_remark, need_to_edit_switch_con: @cord.need_to_edit_switch_con, need_to_edit_where_used_plant: @cord.need_to_edit_where_used_plant, need_to_edit_where_used_product: @cord.need_to_edit_where_used_product, partnumber: @cord.partnumber, plug_type: @cord.plug_type, polarity: @cord.polarity, release_status: @cord.release_status, remark: @cord.remark, switch_con: @cord.switch_con, uploaded_by_section: @cord.uploaded_by_section, uploader_name: @cord.uploader_name, uploader_role: @cord.uploader_role, where_used_plant: @cord.where_used_plant, where_used_product: @cord.where_used_product }
    end

    assert_redirected_to cord_path(assigns(:cord))
  end

  test "should show cord" do
    get :show, id: @cord
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cord
    assert_response :success
  end

  test "should update cord" do
    patch :update, id: @cord, cord: { cord_mat: @cord.cord_mat, cord_od: @cord.cord_od, cord_spec: @cord.cord_spec, cord_type: @cord.cord_type, cross_sec: @cord.cross_sec, description: @cord.description, dismantled_length: @cord.dismantled_length, drawing_norm: @cord.drawing_norm, length: @cord.length, need_to_edit_cord_mat: @cord.need_to_edit_cord_mat, need_to_edit_cord_od: @cord.need_to_edit_cord_od, need_to_edit_cord_spec: @cord.need_to_edit_cord_spec, need_to_edit_cord_type: @cord.need_to_edit_cord_type, need_to_edit_cross_sec: @cord.need_to_edit_cross_sec, need_to_edit_description: @cord.need_to_edit_description, need_to_edit_dismantled_length: @cord.need_to_edit_dismantled_length, need_to_edit_drawing_norm: @cord.need_to_edit_drawing_norm, need_to_edit_length: @cord.need_to_edit_length, need_to_edit_partnumber: @cord.need_to_edit_partnumber, need_to_edit_plug_type: @cord.need_to_edit_plug_type, need_to_edit_polarity: @cord.need_to_edit_polarity, need_to_edit_remark: @cord.need_to_edit_remark, need_to_edit_switch_con: @cord.need_to_edit_switch_con, need_to_edit_where_used_plant: @cord.need_to_edit_where_used_plant, need_to_edit_where_used_product: @cord.need_to_edit_where_used_product, partnumber: @cord.partnumber, plug_type: @cord.plug_type, polarity: @cord.polarity, release_status: @cord.release_status, remark: @cord.remark, switch_con: @cord.switch_con, uploaded_by_section: @cord.uploaded_by_section, uploader_name: @cord.uploader_name, uploader_role: @cord.uploader_role, where_used_plant: @cord.where_used_plant, where_used_product: @cord.where_used_product }
    assert_redirected_to cord_path(assigns(:cord))
  end

  test "should destroy cord" do
    assert_difference('Cord.count', -1) do
      delete :destroy, id: @cord
    end

    assert_redirected_to cords_path
  end
end
