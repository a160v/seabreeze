class BookingsController < ApplicationController
  before_action :set_booking, only: %i[accept reject]

  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end


  def pending
    return true
  end

  def accept
    @booking.accept!
    # @booking.status = "pending"
    # redirect_to bookings_path, notice: "Booking was accepted"
  end

  def reject
    @booking.reject!
    # redirect_to boat_bookings_path, notice: "Booking was rejected"
  end

  private

  def set_boat
    @boat = Boat.find(params[:boat_id])
  end

  def set_booking
    # @booking = current_user.bookings.find(params[:id])
    @booking = Booking.find(params[:id])
  end

end
