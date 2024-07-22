Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'customers/:id', to: 'customers#show', as: 'customer'

  post 'customers/:id/add_item', to: 'customers#add_item', as: 'add_item_customer'

  
  # Defines the root path route ("/")
  # root "articles#index"
end
