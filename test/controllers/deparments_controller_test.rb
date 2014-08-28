require 'test_helper'

class DeparmentsControllerTest < ActionController::TestCase
  setup do
    @deparment = deparments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deparments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deparment" do
    assert_difference('Deparment.count') do
      post :create, deparment: { name: @deparment.name }
    end

    assert_redirected_to deparment_path(assigns(:deparment))
  end

  test "should show deparment" do
    get :show, id: @deparment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deparment
    assert_response :success
  end

  test "should update deparment" do
    patch :update, id: @deparment, deparment: { name: @deparment.name }
    assert_redirected_to deparment_path(assigns(:deparment))
  end

  test "should destroy deparment" do
    assert_difference('Deparment.count', -1) do
      delete :destroy, id: @deparment
    end

    assert_redirected_to deparments_path
  end
end
