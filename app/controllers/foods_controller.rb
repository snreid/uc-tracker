class FoodsController < ApplicationController

  before_action :set_food, only: [:show, :edit, :update, :destroy]

  # GET /foods
  # GET /foods.json
  def index
    @foods = current_user.foods
  end

  def search
    @results = []
    @response = food_api.search(search_params)

    unless @response.info.has_key? "errors"
      @results = @response.list.item
    end
  rescue
    @response = JsonObject.new({"errors" => {"error" => [{"message" => "The USDA API cannot be reached at this time. You may not be connected to the internet."}]}})
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.find_or_create_by(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to :back, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def food_api
      @food_api ||= USDA::FoodAPI.new
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:name, :usda_ndbno, :user_id, :serving_size, :calories, :fat, :carbohydrates, :protein, :fiber, :sodium,:sugars)
    end

    def search_params
      params.permit(:q)
    end
end
