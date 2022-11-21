class EmployeeBookingsController < ApplicationController
  before_action :set_booking
  def create
    @employee = Employee.find_by(id: employee_booking_params[:id])
    @booking.employees.push @employee
    redirect_to booking_path(@booking), notice: t("employee_booking.created")
  end

  def destroy
  end

  private

  def set_booking
    @booking = current_user.created_bookings.find_by(id: params[:booking_id])
  end

  def employee_booking_params
    params.require(:employee_booking).permit(:employee_id)
  end
end
