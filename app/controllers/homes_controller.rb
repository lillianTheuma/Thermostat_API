class HomesController < ApplicationController

  def index
    name = params[:name]
    @homes = Home.search(name)
    json_response(@homes)
  end

  def show
    @home = Home.find(params[:id])
    json_response(@home)
  end

  def create
    @home = Home.create!(home_params)
    json_response(@home, 201)
  end

  def update
    @home = Home.find(params[:id])
    if @home.update!(home_params)
      render status: 200, json: {
        message: "This home has been updated successfully."
      }
    end
  end

  def destroy
    @home = Home.find(params[:id])
    if @home.destroy
      render status: 200, json: {
        message: "This home has been deleted successfully."
      }
    end
  end

  private

  def home_params
    params.permit(:name, :address)
  end
end
