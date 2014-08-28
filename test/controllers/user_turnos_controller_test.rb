require 'test_helper'

class UserTurnosControllerTest < ActionController::TestCase
  setup do
    @user_turno = user_turnos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_turnos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_turno" do
    assert_difference('UserTurno.count') do
      post :create, user_turno: { turno_id: @user_turno.turno_id, user_id: @user_turno.user_id }
    end

    assert_redirected_to user_turno_path(assigns(:user_turno))
  end

  test "should show user_turno" do
    get :show, id: @user_turno
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_turno
    assert_response :success
  end

  test "should update user_turno" do
    patch :update, id: @user_turno, user_turno: { turno_id: @user_turno.turno_id, user_id: @user_turno.user_id }
    assert_redirected_to user_turno_path(assigns(:user_turno))
  end

  test "should destroy user_turno" do
    assert_difference('UserTurno.count', -1) do
      delete :destroy, id: @user_turno
    end

    assert_redirected_to user_turnos_path
  end
end
