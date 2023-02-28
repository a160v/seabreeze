Rails.application.routes.draw do
  devise_for :users
  # Homepage
  root to: "pages#home"
  # Index
  get "boats", to: "boats#index"
  # New boat page
  get "/boats/new" => "boats#new"
  # Create boat page
  post "/boats" => "boats#create", as: :create_boat
  # 'Show' boat page
  get "/boats/:id" => "boats#show", as: :boat
  # Edit boat
  get "boats/:id/edit" => "boats#edit"
  patch "boats/:id" => "boats#update"
end
