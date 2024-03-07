class FlightsController < ApplicationController
  def index
    @airports =Airport.all
    @flights =Flight.where.not(departure_date: nil).distinct.order(departure_date: :desc)
    @num_tickets =params[:num_tickets]
    @searched_flights = search_flights
  end

  def search_flights
    departure_date = params[:departure_date]
    arrival_airport_id = Airport.find_by(airport_code: params[:arrival_code])&.id
    departure_airport_id = Airport.find_by(airport_code: params[:departure_code])&.id

    return [] unless departure_date && arrival_airport_id && departure_airport_id

    Flight.where(departure_date: departure_date, arrival_airport_id: arrival_airport_id, departure_airport_id: departure_airport_id)

  end
  private
  def flight_params
    params.permit(:arrival_code,:departure_code,:num_tickets,:departure_date)
  end
end
