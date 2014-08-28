require 'test_helper'

class CenterWorksControllerTest < ActionController::TestCase
  setup do
    @center_work = center_works(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:center_works)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create center_work" do
    assert_difference('CenterWork.count') do
      post :create, center_work: { deparment_id: @center_work.deparment_id, name: @center_work.name }
    end

    assert_redirected_to center_work_path(assigns(:center_work))
  end

  test "should show center_work" do
    get :show, id: @center_work
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @center_work
    assert_response :success
  end

  test "should update center_work" do
    patch :update, id: @center_work, center_work: { deparment_id: @center_work.deparment_id, name: @center_work.name }
    assert_redirected_to center_work_path(assigns(:center_work))
  end

  test "should destroy center_work" do
    assert_difference('CenterWork.count', -1) do
      delete :destroy, id: @center_work
    end

    assert_redirected_to center_works_path
  end
end
