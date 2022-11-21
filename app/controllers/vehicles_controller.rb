class VehiclesController < ApplicationController
  before_action :set_employee
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  def index
    @vehicles = @employee.vehicles.order(vehicle_at: :desc)
  end

  def create
    @vehicle = Client.new(vehicle_params)
    if @vehicle.save
      redirect_to vehicle_path(@vehicle), notice: t("vehicle.created")
    end
  end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to vehicle_path(@vehicle), notice: t("vehicle.updated")
    end
  end

  def destroy
    @vehicle.discard
    redirect_to vehicles_path, notice: t("vehicle.discarded")
  end

  private

  def set_employee
    @employee = Employee.find_by(id: params[:employee_id])
  end

  def set_vehicle
    @vehicle = @employee.vehicles.find_by(id: params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:vehicle_at, :address, :vehicle_id, :notes)
  end
end
