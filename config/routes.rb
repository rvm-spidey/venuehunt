Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :pages, only: [:index, :update]
  # resources :venues
  resources :locations

  resources :venues, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :new, :create]
  end

  resources :venues, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:index, :new, :create]
  end

  resources :carts do
    resources :placeorders
  end



  resources :carts


  resources :messages

  resources :bookings



  resources :chatrooms do
    resources :messages, only: :create
  end

  # resources :chatrooms, only: :show do
  #   resources :messages, only: :create
  # end
end
