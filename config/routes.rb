Rails.application.routes.draw do
  resources :bdleituras
  resources :bdsensors
  resources :bdtipos
  resources :bdusuarios
  resources :bdclientes

  resources :bdclientes do
    resources :bdsensors do
      resources :bdleituras
    end
  end

  resources :bdclientes do
    resources :bdusuarios
  end

  resources :bdsensors do
    resources :bdleituras
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'home#index'
 get 'home', to: 'home#index'

end
