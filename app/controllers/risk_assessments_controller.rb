class RiskAssessmentsController < ApplicationController
  before_action :set_risk_assessment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @risk_assessments = RiskAssessment.all
    respond_with(@risk_assessments)
  end

  def show
    respond_with(@risk_assessment)
  end

  def new
    @risk_assessment = RiskAssessment.new
    respond_with(@risk_assessment)
  end

  def edit
  end

  def create
    @risk_assessment = RiskAssessment.new(risk_assessment_params)
    @risk_assessment.save
    respond_with(@risk_assessment)
  end

  def update
    @risk_assessment.update(risk_assessment_params)
    respond_with(@risk_assessment)
  end

  def destroy
    @risk_assessment.destroy
    respond_with(@risk_assessment)
  end

  private
    def set_risk_assessment
      @risk_assessment = RiskAssessment.find(params[:id])
    end

    def risk_assessment_params
      params[:risk_assessment]
    end
end
