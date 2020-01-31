class TemperaturesController < ApplicationController

  def index
    name = params[:name]
    @temperatures = Temperature.search(name)
    json_response(@temperatures)
  end

  def show
    @temperature = Temperature.find(params[:id])
    json_response(@temperature)
  end

  def create
    @temperature = Temperature.create!(temperature_params)
    json_response(@temperature, 201)
  end

  def update
    @temperature = Temperature.find(params[:id])
    if @temperature.update!(temperature_params)
      render status: 200, json: {
        message: "This temperature has been updated successfully."
      }
    end
  end

  def destroy
    @temperature = Temperature.find(params[:id])
    if @temperature.destroy
      render status: 200, json: {
        message: "This temperature has been deleted successfully."
      }
    end
  end

  private

  def temperature_params
    params.permit(:temperature)
  end
end
