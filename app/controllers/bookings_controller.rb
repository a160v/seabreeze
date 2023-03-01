class BookingsController < ApplicationController
  before_action :set_boat, only: %i[new index create]

  def new
    @booking = Booking.new
  end

  def index
    @bookings = @boat.bookings
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.boat = @boat
    @booking.user = current_user
    @booking.booking_price = (@booking.check_out&.to_date - @booking.check_in&.to_date) * @boat.price_per_day
    @booking.save!
    redirect_to boat_bookings_path
  end

  private

  def set_boat
    @boat = Boat.find(params[:boat_id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :price_per_day)
  end
end
