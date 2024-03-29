Rails.application.routes.draw do
  get 'recipe_foods/new'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  get 'public_recipes', to: 'recipes#public_recipes'

  resources :foods
  resources :users
  resources :shopping_lists
  resources :recipes do
    member do
      patch 'toggle', to: 'recipes#toggle_recipe'
    end
    resources :recipe_foods
  end
  root "recipes#index"
end
