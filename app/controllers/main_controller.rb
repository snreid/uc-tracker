class MainController < ApplicationController
  def index
    flash[:success] = "Welcome!"
  end
end