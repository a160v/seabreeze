class Boats::BookingsController < ApplicationController
  def index
    @boat = current_user.boats.find(params [:listing_id])
    @bookings = @boat.bookings
  end

  # def show
  #   @booking = Booking.find(params[:id])
  # end

end
