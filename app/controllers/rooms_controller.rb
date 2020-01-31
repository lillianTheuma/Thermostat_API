class RoomsController < ApplicationController

  def index
    @home = Home.find(params[:home_id])
    @rooms = @home.rooms
    json_response(@rooms)
  end

  def show
    @room = Room.find(params[:id])
    json_response(@room)
  end

  def latest_temp_by_room
    @home = Home.find(params[:home_id])
    @room = Room.find(params[:room_id])
    @temperature = @room.temperatures.most_recent[0]
    json_response(@temperature)
  end

  def create
    @home = Home.find(params[:home_id])
    @room = @home.rooms.create!(room_params)
    json_response(@room, 201)
  end

  def update
    @room = Room.find(params[:id])
    if @room.update!(room_params)
      render status: 200, json: {
        message: "This room has been updated successfully."
      }
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      render status: 200, json: {
        message: "This room has been deleted successfully."
      }
    end
  end

  private

  def room_params
    params.permit(:name)
  end
end
