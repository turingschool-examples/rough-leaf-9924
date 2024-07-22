Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # customer routes
  get 'customers/:id', to: 'customers#show'
  post 'customers/:id/items', to: 'customer_items#create'

  # item routes
  get 'items', to: 'items#index'
end
