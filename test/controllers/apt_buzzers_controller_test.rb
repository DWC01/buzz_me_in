require 'test_helper'

class AptBuzzersControllerTest < ActionController::TestCase
  setup do
    @apt_buzzer = apt_buzzers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apt_buzzers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apt_buzzer" do
    assert_difference('AptBuzzer.count') do
      post :create, apt_buzzer: {  }
    end

    assert_redirected_to apt_buzzer_path(assigns(:apt_buzzer))
  end

  test "should show apt_buzzer" do
    get :show, id: @apt_buzzer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apt_buzzer
    assert_response :success
  end

  test "should update apt_buzzer" do
    patch :update, id: @apt_buzzer, apt_buzzer: {  }
    assert_redirected_to apt_buzzer_path(assigns(:apt_buzzer))
  end

  test "should destroy apt_buzzer" do
    assert_difference('AptBuzzer.count', -1) do
      delete :destroy, id: @apt_buzzer
    end

    assert_redirected_to apt_buzzers_path
  end
end
