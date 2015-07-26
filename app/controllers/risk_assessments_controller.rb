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
    
    respond_to do |format|
      if @risk_assessment.save
        format.html { redirect_to :back, notice: 'Risk was successfully created.' }
      end
    end
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
      params.require(:risk_assessment).permit(:user_id, :level, :risk_assessable_id, :risk_assessable_type)
    end
end
