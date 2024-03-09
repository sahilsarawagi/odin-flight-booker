class BookingsController < ApplicationController
  def new
    @selected_flight =params[:selected_flight]
    @flight = Flight.find(@selected_flight)
    @booking = Booking.new
    params[:num_tickets].to_i.times {@booking.passengers.build}
  end
  def create
    @booking = Booking.new(booking_params)
    flight = @booking.flight
    respond_to do |format|
      if @booking.save
        # Tell the UserMailer to send a welcome email after save
        @booking.passengers.each do |passenger|
          PassengerMailer.confirmation_email(passenger,flight).deliver_later
        end

        format.html { redirect_to(@booking, notice: 'Booking was successfully created.') }
        format.json { render json: @booking, status: :created, location: @booking }
      else
        format.html { render action: 'new' }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
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
