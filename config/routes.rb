# == Route Map
#

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "bookings#index"

  resources :sessions

  resources :employees do
    resources :vehicles
  end

  resources :clients
  resources :users

  resources :bookings do
    resources :employees, controller: "employee_bookings"
  end
end
