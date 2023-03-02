class BookingsController < ApplicationController
  before_action :set_boat, only: %i[new index create accept reject]
  before_action :set_booking, only: %i[accept reject]

  def index
    @bookings = current_user.bookings
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.boat = @boat
    @booking.user = current_user
    authorize @booking
    @booking.booking_price = (@booking.check_out&.to_date - @booking.check_in&.to_date) * @boat.price_per_day
    @booking.status = "pending"
    @booking.save!
    redirect_to boat_bookings_path
  end

  def pending
    return true
  end

  def accept
    authorize @booking
    @booking.accept!
    # @booking.status = "pending"
    # redirect_to bookings_path, notice: "Booking was accepted"
  end

  def reject
    authorize @booking
    @booking.reject!
    # redirect_to boat_bookings_path, notice: "Booking was rejected"
  end

  private

  def set_boat
    @boat = Boat.find(params[:boat_id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :price_per_day)
  end

  def set_booking
    # @booking = current_user.bookings.find(params[:id])
    @booking = Booking.find(params[:id])
  end

end
