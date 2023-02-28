Rails.application.routes.draw do
  devise_for :users
  # Homepage
  root to: "pages#home"
  # New boat page
  get "/boats/new" => "boats#new"
  # Create boat page
  post "/boats" => "boats#create", as: :create_boat
  # 'Show' boat page
  get "/boats/:id" => "boats#show", as: :boat
  # Edit boat
  get "boats/:id/edit" => "boats#edit"
  patch "boats/:id" => "boats#update"
  # My boats page
  get "/my-boats/", to: "pages#home", constraints: ->(request) {
    boat = Boat.find_by(id: request.params[:boat_id])
    boat && boat.user_id == request.session[:user_id]
  }
end
