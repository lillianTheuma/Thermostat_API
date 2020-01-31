class HomesController < ApplicationController

  def index
    @homes = Home.all
    json_response(@homes)
  end

  def show
    @home = Home.find(params[:id])
    json_response(@home)
  end

  def latest_temps_by_home
    puts(params[:id].to_s)
    @home = Home.find(params[:home_id])
    @rooms = @home.rooms
    @temperatures = []

    @rooms.each do |current_room|
      @temperatures.push(current_room.temperatures.most_recent[0])
    end
    json_response(@temperatures)
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
