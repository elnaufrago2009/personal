require 'test_helper'

class IniciosControllerTest < ActionController::TestCase
  setup do
    @inicio = inicios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inicios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inicio" do
    assert_difference('Inicio.count') do
      post :create, inicio: { nombre: @inicio.nombre }
    end

    assert_redirected_to inicio_path(assigns(:inicio))
  end

  test "should show inicio" do
    get :show, id: @inicio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inicio
    assert_response :success
  end

  test "should update inicio" do
    patch :update, id: @inicio, inicio: { nombre: @inicio.nombre }
    assert_redirected_to inicio_path(assigns(:inicio))
  end

  test "should destroy inicio" do
    assert_difference('Inicio.count', -1) do
      delete :destroy, id: @inicio
    end

    assert_redirected_to inicios_path
  end
end
