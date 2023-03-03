class BoatsController < ApplicationController
  before_action :set_boat, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      # Perform a global search in the Boats#index
      @boats = Boat.global_search(params[:query])
    else
      # Otherwise show all boats
      @boats = Boat.all
    end
    # Apply the policy scope to the boats
    @boats = policy_scope(Boat)
  end

  def show
    # The `geocoded` scope filters only boats with coordinates
    @markers = [
      {
        lat: @boat.latitude,
        lng: @boat.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {boat: @boat}),
        marker_html: render_to_string(partial: "marker")
      }]
    authorize @boat
    @booking = @boat.bookings.build
  end

  def new
    # Fetch data from the new boat form
    @boat = Boat.new
    authorize @boat
  end

  def create
    @boat = Boat.new(boat_params)
    # Set boat.user_id to current_user.id
    @boat.user = current_user
    authorize @boat
    if @boat.save
      redirect_to boat_path(@boat)
    else
      # If the boat is invalid, show unprocessable entity
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @boat
  end

  def update
    authorize @boat
    @boat.update(boat_params)
    redirect_to boat_path(@boat)
  end

  def destroy
    authorize @boat
    @boat.destroy
    redirect_to boats_path, status: :see_other
  end

  private

  def boat_params
    params.require(:boat).permit(:title, :price_per_day, :status, :address)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end
end
