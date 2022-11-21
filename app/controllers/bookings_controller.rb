class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = current_user.bookings.where("booking_at > NOW()").order(booking_at: :asc)
  end

  def new
    @booking = Booking.new
    @booking.build_client
  end

  def create
    @booking = Booking.new(booking_params.merge(
      created_by: current_user,
      address: booking_params["client_attributes"]["address"],
      email_address: booking_params["client_attributes"]["email_address"]
    ))
    if @booking.save
      redirect_to booking_path(@booking), notice: t("booking.created")
    else
      flash[:error] = @booking.errors
      render template: "bookings/new"
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking), notice: t("booking.updated")
    end
  end

  def destroy
    @booking.discard
    redirect_to bookings_path, notice: t("booking.discarded")
  end

  private

  def set_booking
    @booking = current_user.bookings.order(booking_at: :desc).find_by(id: params[:id])
  end

  def booking_params
    params.require(:booking).permit(:booking_at, :notes, client_attributes: [:email_address, :firstname, :surname, :phone_number, :address, :date_of_birth])
  end
end
