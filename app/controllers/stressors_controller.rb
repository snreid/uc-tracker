class StressorsController < ApplicationController
  before_action :set_stressor, only: [:show, :edit, :update, :destroy]

  # GET /stressors
  # GET /stressors.json
  def index
    @stressors = Stressor.all
  end

  # GET /stressors/1
  # GET /stressors/1.json
  def show
  end

  # GET /stressors/new
  def new
    @stressor = Stressor.new
  end

  # GET /stressors/1/edit
  def edit
  end

  # POST /stressors
  # POST /stressors.json
  def create
    @stressor = Stressor.new(stressor_params)

    respond_to do |format|
      if @stressor.save
        format.html { redirect_to @stressor, notice: 'Stressor was successfully created.' }
        format.json { render :show, status: :created, location: @stressor }
      else
        format.html { render :new }
        format.json { render json: @stressor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stressors/1
  # PATCH/PUT /stressors/1.json
  def update
    respond_to do |format|
      if @stressor.update(stressor_params)
        format.html { redirect_to @stressor, notice: 'Stressor was successfully updated.' }
        format.json { render :show, status: :ok, location: @stressor }
      else
        format.html { render :edit }
        format.json { render json: @stressor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stressors/1
  # DELETE /stressors/1.json
  def destroy
    @stressor.destroy
    respond_to do |format|
      format.html { redirect_to stressors_url, notice: 'Stressor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stressor
      @stressor = Stressor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stressor_params
      params[:stressor]
    end
end
