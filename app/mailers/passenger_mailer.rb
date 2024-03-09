class PassengerMailer < ApplicationMailer
  def confirmation_email(passenger,flight)
    @passenger = passenger
    @flight = flight
    mail(to: @passenger.email, subject: 'Ticket Confirmation')
  end
end
