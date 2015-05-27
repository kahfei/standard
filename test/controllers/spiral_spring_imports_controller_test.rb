require 'test_helper'

class SpiralSpringImportsControllerTest < ActionController::TestCase
  setup do
    @spiral_spring_import = spiral_spring_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spiral_spring_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spiral_spring_import" do
    assert_difference('SpiralSpringImport.count') do
      post :create, spiral_spring_import: {  }
    end

    assert_redirected_to spiral_spring_import_path(assigns(:spiral_spring_import))
  end

  test "should show spiral_spring_import" do
    get :show, id: @spiral_spring_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spiral_spring_import
    assert_response :success
  end

  test "should update spiral_spring_import" do
    patch :update, id: @spiral_spring_import, spiral_spring_import: {  }
    assert_redirected_to spiral_spring_import_path(assigns(:spiral_spring_import))
  end

  test "should destroy spiral_spring_import" do
    assert_difference('SpiralSpringImport.count', -1) do
      delete :destroy, id: @spiral_spring_import
    end

    assert_redirected_to spiral_spring_imports_path
  end
end
