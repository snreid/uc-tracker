require 'test_helper'

class PhysicalActivitiesControllerTest < ActionController::TestCase
  setup do
    @physical_activity = physical_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:physical_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create physical_activity" do
    assert_difference('PhysicalActivity.count') do
      post :create, physical_activity: {  }
    end

    assert_redirected_to physical_activity_path(assigns(:physical_activity))
  end

  test "should show physical_activity" do
    get :show, id: @physical_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @physical_activity
    assert_response :success
  end

  test "should update physical_activity" do
    patch :update, id: @physical_activity, physical_activity: {  }
    assert_redirected_to physical_activity_path(assigns(:physical_activity))
  end

  test "should destroy physical_activity" do
    assert_difference('PhysicalActivity.count', -1) do
      delete :destroy, id: @physical_activity
    end

    assert_redirected_to physical_activities_path
  end
end
