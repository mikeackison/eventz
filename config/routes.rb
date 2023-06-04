Rails.application.routes.draw do
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "events#index"
  get "events/filter/:filter" => "events#index", as: :filtered_events

  resources :events do
    resources :likes
    resources :registrations
  end

  resource :session, only: [:new, :create, :destroy]

  resources :users
  get "signup" => "users#new"
  get "signin" => "sessions#new"
end
