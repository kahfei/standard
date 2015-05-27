require 'test_helper'

class ScrewsControllerTest < ActionController::TestCase
  setup do
    @screw = screws(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:screws)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create screw" do
    assert_difference('Screw.count') do
      post :create, screw: { coating: @screw.coating, connection_material: @screw.connection_material, description: @screw.description, drawing_norm: @screw.drawing_norm, length: @screw.length, need_to_edit_coating: @screw.need_to_edit_coating, need_to_edit_connection_material: @screw.need_to_edit_connection_material, need_to_edit_description: @screw.need_to_edit_description, need_to_edit_drawing_norm: @screw.need_to_edit_drawing_norm, need_to_edit_length: @screw.need_to_edit_length, need_to_edit_partnumber: @screw.need_to_edit_partnumber, need_to_edit_remark: @screw.need_to_edit_remark, need_to_edit_screw_drive: @screw.need_to_edit_screw_drive, need_to_edit_screw_head: @screw.need_to_edit_screw_head, need_to_edit_screw_size: @screw.need_to_edit_screw_size, need_to_edit_thread_type: @screw.need_to_edit_thread_type, need_to_edit_where_used_plant: @screw.need_to_edit_where_used_plant, need_to_edit_where_used_product: @screw.need_to_edit_where_used_product, partnumber: @screw.partnumber, release_status: @screw.release_status, remark: @screw.remark, screw_drive: @screw.screw_drive, screw_head: @screw.screw_head, screw_size: @screw.screw_size, thread_type: @screw.thread_type, uploaded_by_section: @screw.uploaded_by_section, uploader_name: @screw.uploader_name, uploader_role: @screw.uploader_role, where_used_plant: @screw.where_used_plant, where_used_product: @screw.where_used_product }
    end

    assert_redirected_to screw_path(assigns(:screw))
  end

  test "should show screw" do
    get :show, id: @screw
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @screw
    assert_response :success
  end

  test "should update screw" do
    patch :update, id: @screw, screw: { coating: @screw.coating, connection_material: @screw.connection_material, description: @screw.description, drawing_norm: @screw.drawing_norm, length: @screw.length, need_to_edit_coating: @screw.need_to_edit_coating, need_to_edit_connection_material: @screw.need_to_edit_connection_material, need_to_edit_description: @screw.need_to_edit_description, need_to_edit_drawing_norm: @screw.need_to_edit_drawing_norm, need_to_edit_length: @screw.need_to_edit_length, need_to_edit_partnumber: @screw.need_to_edit_partnumber, need_to_edit_remark: @screw.need_to_edit_remark, need_to_edit_screw_drive: @screw.need_to_edit_screw_drive, need_to_edit_screw_head: @screw.need_to_edit_screw_head, need_to_edit_screw_size: @screw.need_to_edit_screw_size, need_to_edit_thread_type: @screw.need_to_edit_thread_type, need_to_edit_where_used_plant: @screw.need_to_edit_where_used_plant, need_to_edit_where_used_product: @screw.need_to_edit_where_used_product, partnumber: @screw.partnumber, release_status: @screw.release_status, remark: @screw.remark, screw_drive: @screw.screw_drive, screw_head: @screw.screw_head, screw_size: @screw.screw_size, thread_type: @screw.thread_type, uploaded_by_section: @screw.uploaded_by_section, uploader_name: @screw.uploader_name, uploader_role: @screw.uploader_role, where_used_plant: @screw.where_used_plant, where_used_product: @screw.where_used_product }
    assert_redirected_to screw_path(assigns(:screw))
  end

  test "should destroy screw" do
    assert_difference('Screw.count', -1) do
      delete :destroy, id: @screw
    end

    assert_redirected_to screws_path
  end
end
