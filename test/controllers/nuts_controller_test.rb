require 'test_helper'

class NutsControllerTest < ActionController::TestCase
  setup do
    @nut = nuts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nuts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nut" do
    assert_difference('Nut.count') do
      post :create, nut: { coating: @nut.coating, description: @nut.description, drawing_norm: @nut.drawing_norm, need_to_edit_coating: @nut.need_to_edit_coating, need_to_edit_description: @nut.need_to_edit_description, need_to_edit_drawing_norm: @nut.need_to_edit_drawing_norm, need_to_edit_nut_size: @nut.need_to_edit_nut_size, need_to_edit_nut_type: @nut.need_to_edit_nut_type, need_to_edit_partnumber: @nut.need_to_edit_partnumber, need_to_edit_remark: @nut.need_to_edit_remark, need_to_edit_where_used_plant: @nut.need_to_edit_where_used_plant, need_to_edit_where_used_product: @nut.need_to_edit_where_used_product, need_to_edit_width: @nut.need_to_edit_width, nut_size: @nut.nut_size, nut_type: @nut.nut_type, partnumber: @nut.partnumber, release_status: @nut.release_status, remark: @nut.remark, uploaded_by_section: @nut.uploaded_by_section, uploader_name: @nut.uploader_name, uploader_role: @nut.uploader_role, where_used_plant: @nut.where_used_plant, where_used_product: @nut.where_used_product, width: @nut.width }
    end

    assert_redirected_to nut_path(assigns(:nut))
  end

  test "should show nut" do
    get :show, id: @nut
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nut
    assert_response :success
  end

  test "should update nut" do
    patch :update, id: @nut, nut: { coating: @nut.coating, description: @nut.description, drawing_norm: @nut.drawing_norm, need_to_edit_coating: @nut.need_to_edit_coating, need_to_edit_description: @nut.need_to_edit_description, need_to_edit_drawing_norm: @nut.need_to_edit_drawing_norm, need_to_edit_nut_size: @nut.need_to_edit_nut_size, need_to_edit_nut_type: @nut.need_to_edit_nut_type, need_to_edit_partnumber: @nut.need_to_edit_partnumber, need_to_edit_remark: @nut.need_to_edit_remark, need_to_edit_where_used_plant: @nut.need_to_edit_where_used_plant, need_to_edit_where_used_product: @nut.need_to_edit_where_used_product, need_to_edit_width: @nut.need_to_edit_width, nut_size: @nut.nut_size, nut_type: @nut.nut_type, partnumber: @nut.partnumber, release_status: @nut.release_status, remark: @nut.remark, uploaded_by_section: @nut.uploaded_by_section, uploader_name: @nut.uploader_name, uploader_role: @nut.uploader_role, where_used_plant: @nut.where_used_plant, where_used_product: @nut.where_used_product, width: @nut.width }
    assert_redirected_to nut_path(assigns(:nut))
  end

  test "should destroy nut" do
    assert_difference('Nut.count', -1) do
      delete :destroy, id: @nut
    end

    assert_redirected_to nuts_path
  end
end
