Rails.application.routes.draw do
  get 'reservations/create'
  get 'reservations/destroy'
  devise_for :signs, controllers: { registrations: 'signs/registrations' }
  resources :rooms do
    resource :reservations, only: [:create, :destroy]
    collection do
      get 'search'
      get 'myroom'
      get 'mycheckroom'
    end
  end
  resources :signs do
    collection do
      get 'account'
      get 'show'
    end
  end
  resources :signs, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "rooms#index"
  get "signs/:id/account" => "signs#account"
  get '/signs/:id' => 'signs#show'
  patch '/signs/:id', to: 'signs#update'
  get "rooms/:id/reservations" => "rooms#reservations"

end
