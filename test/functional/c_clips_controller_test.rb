require 'test_helper'

class CClipsControllerTest < ActionController::TestCase
  setup do
    @c_clip = c_clips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:c_clips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create c_clip" do
    assert_difference('CClip.count') do
      post :create, :c_clip => @c_clip.attributes
    end

    assert_redirected_to c_clip_path(assigns(:c_clip))
  end

  test "should show c_clip" do
    get :show, :id => @c_clip.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @c_clip.to_param
    assert_response :success
  end

  test "should update c_clip" do
    put :update, :id => @c_clip.to_param, :c_clip => @c_clip.attributes
    assert_redirected_to c_clip_path(assigns(:c_clip))
  end

  test "should destroy c_clip" do
    assert_difference('CClip.count', -1) do
      delete :destroy, :id => @c_clip.to_param
    end

    assert_redirected_to c_clips_path
  end
end
