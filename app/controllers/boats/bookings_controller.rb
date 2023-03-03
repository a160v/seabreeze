class Boats::BookingsController < ApplicationController
  before_action :set_boat, only: %i[new index create]
  def index
    @bookings = @boat.bookings
    authorize @booking
  end

  def new
    @booking = @boat.bookings.new
    authorize @booking
  end

  def create
    @booking = @boat.bookings.new(booking_params)
    @booking.user = current_user
    authorize @booking
    @booking.booking_price = (@booking.check_out&.to_date - @booking.check_in&.to_date) * @boat.price_per_day
    @booking.status = "pending"
    @booking.save!
    redirect_to bookings_path
  end

  private

  def set_boat
    @boat = Boat.find(params[:boat_id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :price_per_day, :status)
  end
end
