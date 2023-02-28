class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end
  def show
    @boat = Boat.find(params[:id])

    # get "/my-boats/", to: "pages#home", constraints: ->(request) {
    #   boat = Boat.find_by(id: request.params[:boat_id])
    #   boat && boat.user_id == request.session[:user_id]
  end
  def new
    @boat = Boat.new # Needed to instantiate the form_with
  end
  def create
    @boat = Boat.new(boat_params)
    @boat.save # Will raise ActiveModel::ForbiddenAttributesError
  end
  def edit
    @boat = Boat.find(params[:id])
  end
  def update
    @boat = Boat.find(params[:id])
    @boat.update(boat_params)
    redirect_to boat_path(@boat)
  end
  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to boats_path, status: :see_other
  end

private

def boat_params
  params.require(:boat).permit(:title, :price_per_day)
end

end
