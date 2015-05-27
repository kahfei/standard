require 'test_helper'

class CordClipsControllerTest < ActionController::TestCase
  setup do
    @cord_clip = cord_clips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cord_clips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cord_clip" do
    assert_difference('CordClip.count') do
      post :create, cord_clip: { cord_clip_type: @cord_clip.cord_clip_type, description: @cord_clip.description, drawing_norm: @cord_clip.drawing_norm, material: @cord_clip.material, max_cord_od: @cord_clip.max_cord_od, need_to_edit_cord_clip_type: @cord_clip.need_to_edit_cord_clip_type, need_to_edit_description: @cord_clip.need_to_edit_description, need_to_edit_drawing_norm: @cord_clip.need_to_edit_drawing_norm, need_to_edit_material: @cord_clip.need_to_edit_material, need_to_edit_max_cord_od: @cord_clip.need_to_edit_max_cord_od, need_to_edit_partnumber: @cord_clip.need_to_edit_partnumber, need_to_edit_remark: @cord_clip.need_to_edit_remark, need_to_edit_where_used_plant: @cord_clip.need_to_edit_where_used_plant, need_to_edit_where_used_product: @cord_clip.need_to_edit_where_used_product, partnumber: @cord_clip.partnumber, release_status: @cord_clip.release_status, remark: @cord_clip.remark, uploaded_by_section: @cord_clip.uploaded_by_section, uploader_name: @cord_clip.uploader_name, uploader_role: @cord_clip.uploader_role, where_used_plant: @cord_clip.where_used_plant, where_used_product: @cord_clip.where_used_product }
    end

    assert_redirected_to cord_clip_path(assigns(:cord_clip))
  end

  test "should show cord_clip" do
    get :show, id: @cord_clip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cord_clip
    assert_response :success
  end

  test "should update cord_clip" do
    patch :update, id: @cord_clip, cord_clip: { cord_clip_type: @cord_clip.cord_clip_type, description: @cord_clip.description, drawing_norm: @cord_clip.drawing_norm, material: @cord_clip.material, max_cord_od: @cord_clip.max_cord_od, need_to_edit_cord_clip_type: @cord_clip.need_to_edit_cord_clip_type, need_to_edit_description: @cord_clip.need_to_edit_description, need_to_edit_drawing_norm: @cord_clip.need_to_edit_drawing_norm, need_to_edit_material: @cord_clip.need_to_edit_material, need_to_edit_max_cord_od: @cord_clip.need_to_edit_max_cord_od, need_to_edit_partnumber: @cord_clip.need_to_edit_partnumber, need_to_edit_remark: @cord_clip.need_to_edit_remark, need_to_edit_where_used_plant: @cord_clip.need_to_edit_where_used_plant, need_to_edit_where_used_product: @cord_clip.need_to_edit_where_used_product, partnumber: @cord_clip.partnumber, release_status: @cord_clip.release_status, remark: @cord_clip.remark, uploaded_by_section: @cord_clip.uploaded_by_section, uploader_name: @cord_clip.uploader_name, uploader_role: @cord_clip.uploader_role, where_used_plant: @cord_clip.where_used_plant, where_used_product: @cord_clip.where_used_product }
    assert_redirected_to cord_clip_path(assigns(:cord_clip))
  end

  test "should destroy cord_clip" do
    assert_difference('CordClip.count', -1) do
      delete :destroy, id: @cord_clip
    end

    assert_redirected_to cord_clips_path
  end
end
