require 'test_helper'

class AssignRolesControllerTest < ActionController::TestCase
  setup do
    @assign_role = assign_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assign_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assign_role" do
    assert_difference('AssignRole.count') do
      post :create, assign_role: { nombre: @assign_role.nombre }
    end

    assert_redirected_to assign_role_path(assigns(:assign_role))
  end

  test "should show assign_role" do
    get :show, id: @assign_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assign_role
    assert_response :success
  end

  test "should update assign_role" do
    patch :update, id: @assign_role, assign_role: { nombre: @assign_role.nombre }
    assert_redirected_to assign_role_path(assigns(:assign_role))
  end

  test "should destroy assign_role" do
    assert_difference('AssignRole.count', -1) do
      delete :destroy, id: @assign_role
    end

    assert_redirected_to assign_roles_path
  end
end
