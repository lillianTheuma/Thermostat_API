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
    @room = Room.find(params[:room_id])
    @temperature = @room.temperatures.most_recent[0]
    json_response(@temperature)
  end

  def configure_temp_setting
    @room = Room.find(params[:room_id])
    if @room.update!(room_params)
      render status: 200, json: {
        message: "Temperature setting adjusted."
      }
    end
  end

  def ac_on?
    @room = Room.find(params[:room_id])
    @temperature = @room.temperatures.most_recent[0].temperature
    if @temperature
      if @temperature > @room.temp_setting
        json_response(true, 200)
      else
        json_response(false, 200)
      end
    else
      json_response(nil, 200)
    end
  end

  def heater_on?
    @room = Room.find(params[:room_id])
    @temperature = @room.temperatures.most_recent[0].temperature
    if @temperature
      if @temperature < @room.temp_setting
        json_response(true, 200)
      else
        json_response(false, 200)
      end
    else
      json_response(nil, 200)
    end
  end

  def create
    @home = Home.find(params[:home_id])
    @room = @home.rooms.create!(room_params)
    json_response(@room, 201)
  end

  def update
    @room = Room.find(params[:room_id])
    if @room.update!(room_params)
      render status: 200, json: {
        message: "This room has been updated successfully."
      }
    end
  end

  def temperatures_today
    @room = Room.find(params[:room_id])
    @temperatures = @room.temperatures.today
    json_response(@temperatures, 200)
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
    params.permit(:name, :temp_setting)
  end
end
