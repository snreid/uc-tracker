require 'test_helper'

class StressorsControllerTest < ActionController::TestCase
  setup do
    @stressor = stressors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stressors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stressor" do
    assert_difference('Stressor.count') do
      post :create, stressor: {  }
    end

    assert_redirected_to stressor_path(assigns(:stressor))
  end

  test "should show stressor" do
    get :show, id: @stressor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stressor
    assert_response :success
  end

  test "should update stressor" do
    patch :update, id: @stressor, stressor: {  }
    assert_redirected_to stressor_path(assigns(:stressor))
  end

  test "should destroy stressor" do
    assert_difference('Stressor.count', -1) do
      delete :destroy, id: @stressor
    end

    assert_redirected_to stressors_path
  end
end
