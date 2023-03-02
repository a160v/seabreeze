class BoatsController < ApplicationController
  before_action :set_boat, only: %i[show edit update destroy]

  def index
    @boats = current_user.boats
  end

  def show
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @boat.update(boat_params)
    redirect_to boat_path(@boat)
  end

  def destroy
    @boat.destroy
    # No need for app/views/boats/destroy.html.erb
    redirect_to boats_path, status: :see_other
  end

  private

  def boat_params
    params.require(:boat).permit(:title, :price_per_day, :status)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end

end
