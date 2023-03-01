class BookingsController < ApplicationController
  before_action :set_boat, only: %i[new create]

  def new
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new
  end

  def index
    @boat = Boat.find(params[:boat_id])
    @bookings = @boat.bookings
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.boat = @boat
    @booking.save
    redirect_to boat_path(@boat)
  end

  private

  def set_boat
    @boat = Boat.find(params[:boat_id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :price_per_day)
  end
end
