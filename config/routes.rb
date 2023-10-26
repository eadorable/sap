Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :activities do
    resources :bookings, only: %i[create]
  end

  resources :bookings, only: %i[show index destroy] do
    member do
      get :accept # => bookings#accept, need to check if get or patch
      get :decline # => bookings#decline, need to check if get or patch
    end
  end
  get 'dashboard', to: 'pages#dashboard'
end
