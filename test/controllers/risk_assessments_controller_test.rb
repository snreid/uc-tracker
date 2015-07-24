require 'test_helper'

class RiskAssessmentsControllerTest < ActionController::TestCase
  setup do
    @risk_assessment = risk_assessments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:risk_assessments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create risk_assessment" do
    assert_difference('RiskAssessment.count') do
      post :create, risk_assessment: {  }
    end

    assert_redirected_to risk_assessment_path(assigns(:risk_assessment))
  end

  test "should show risk_assessment" do
    get :show, id: @risk_assessment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @risk_assessment
    assert_response :success
  end

  test "should update risk_assessment" do
    patch :update, id: @risk_assessment, risk_assessment: {  }
    assert_redirected_to risk_assessment_path(assigns(:risk_assessment))
  end

  test "should destroy risk_assessment" do
    assert_difference('RiskAssessment.count', -1) do
      delete :destroy, id: @risk_assessment
    end

    assert_redirected_to risk_assessments_path
  end
end
