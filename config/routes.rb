Rails.application.routes.draw do
  resources :slides, only: :index do
    get :stream, on: :collection
  end
end
