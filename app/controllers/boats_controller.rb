class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def index
    @boats = Boat.all
  end

  def show
    # if @boat = Boat.find_by(id: request.params[:boat_id])
    # boat && boat.user_id == request.session[:user_id]
  end

  def new
    @boat = Boat.new # Needed to instantiate the form_with
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.save # Will raise ActiveModel::ForbiddenAttributesError
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
    params.require(:boat).permit(:title, :price_per_day)
  end
  
  def set_boat
    @boat = Boat.find(params[:id])
  end

end
