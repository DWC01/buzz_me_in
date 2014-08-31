require 'test_helper'

class BuzzMeAppsControllerTest < ActionController::TestCase
  setup do
    @buzz_me_app = buzz_me_apps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buzz_me_apps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create buzz_me_app" do
    assert_difference('BuzzMeApp.count') do
      post :create, buzz_me_app: {  }
    end

    assert_redirected_to buzz_me_app_path(assigns(:buzz_me_app))
  end

  test "should show buzz_me_app" do
    get :show, id: @buzz_me_app
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @buzz_me_app
    assert_response :success
  end

  test "should update buzz_me_app" do
    patch :update, id: @buzz_me_app, buzz_me_app: {  }
    assert_redirected_to buzz_me_app_path(assigns(:buzz_me_app))
  end

  test "should destroy buzz_me_app" do
    assert_difference('BuzzMeApp.count', -1) do
      delete :destroy, id: @buzz_me_app
    end

    assert_redirected_to buzz_me_apps_path
  end
end
