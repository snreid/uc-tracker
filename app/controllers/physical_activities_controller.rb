class PhysicalActivitiesController < ApplicationController
  before_action :set_physical_activity, only: [:show, :edit, :update, :destroy]

  # GET /physical_activities
  # GET /physical_activities.json
  def index
    @physical_activities = PhysicalActivity.all
  end

  # GET /physical_activities/1
  # GET /physical_activities/1.json
  def show
  end

  # GET /physical_activities/new
  def new
    @physical_activity = PhysicalActivity.new
  end

  # GET /physical_activities/1/edit
  def edit
  end

  # POST /physical_activities
  # POST /physical_activities.json
  def create
    @physical_activity = PhysicalActivity.new(physical_activity_params)

    respond_to do |format|
      if @physical_activity.save
        format.html { redirect_to @physical_activity, notice: 'Physical activity was successfully created.' }
        format.json { render :show, status: :created, location: @physical_activity }
      else
        format.html { render :new }
        format.json { render json: @physical_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /physical_activities/1
  # PATCH/PUT /physical_activities/1.json
  def update
    respond_to do |format|
      if @physical_activity.update(physical_activity_params)
        format.html { redirect_to @physical_activity, notice: 'Physical activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @physical_activity }
      else
        format.html { render :edit }
        format.json { render json: @physical_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /physical_activities/1
  # DELETE /physical_activities/1.json
  def destroy
    @physical_activity.destroy
    respond_to do |format|
      format.html { redirect_to physical_activities_url, notice: 'Physical activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_physical_activity
      @physical_activity = PhysicalActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def physical_activity_params
      params[:physical_activity]
    end
end
