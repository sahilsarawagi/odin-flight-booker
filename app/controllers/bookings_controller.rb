class BookingsController < ApplicationController
  def new
    @selected_flight =params[:selected_flight]
    @flight = Flight.find(@selected_flight)
    @booking = Booking.new
    params[:num_tickets].to_i.times {@booking.passengers.build}
  end
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: "Your Booking was successfully created"
    else
      render :new
    end
  end
  def show
    @booking = Booking.find(params[:id])
  end

  private
    def booking_params
      params.require(:booking).permit(:flight_id,passengers_attributes: [:name, :email])
    end
end
