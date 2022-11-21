class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all.order(:surname)
  end

  def create
    @employee = Employee.new(employee_params.merge(created_by: current_user))
    if @employee.save
      redirect_to employee_path(@employee), notice: t("employee.created")
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to employee_path(@employee), notice: t("employee.updated")
    end
  end

  def destroy
    @employee.discard
    redirect_to employees_path, notice: t("employee.discarded")
  end

  private

  def set_employee
    @employee = current_user.created_employees.order(employee_at: :desc).find_by(id: params[:id])
  end

  def employee_params
    params.require(:employee).permit(:employee_at, :address, :employee_id, :notes)
  end
end
