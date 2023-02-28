Rails.application.routes.draw do
  devise_for :users
  # get 'bookings/new'
  # # Read all
  # get    "boats",          to: "boats#index"
  # # Create
  # get    "boats/new",      to: "boats#new",  as: :new_boat
  # post   "boats",          to: "boats#create"
  # # Read one - The `show` route needs to be *after* `new` route.
  # get    "boats/:id",      to: "boats#show", as: :boat
  # # Update
  # get    "boats/:id/edit", to: "boats#edit", as: :edit_boat
  # patch  "boats/:id",      to: "boats#update"
  # # Delete
  # delete "boats/:id",      to: "boats#destroy"
  # get    "bookings/new",      to: "bookings#new",  as: /boats/:boat_id/:new_boat
  # post   "bookings",          to: "bookings#create"
  resources :boats do
    resources :bookings, only: [:new]
  end
end
