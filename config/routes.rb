Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"
  root to: 'activities#index'
  resources :activities do
    resources :bookings, only: %i[create]
  end

  resources :bookings, only: %i[show index destroy] do
    member do
      get :accept
      get :decline
    end
  end
  get 'dashboard', to: 'pages#dashboard'

  resources :chatrooms, only: %i[show index] do
    resources :messages, only: :create
  end
  get 'activities/:id/details', to: 'activities#show_details', as: 'activity_details'

end
