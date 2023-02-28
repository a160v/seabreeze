class BookingsController < ApplicationController
  def new
    # We need @boat in our `simple_form_for`
    @boat = Boat.find(params[:restaurant_id])
    @booking = Booking.new
  end
end
