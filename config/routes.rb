Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'customers/:id', to: 'customers#show', as: 'customer'
  # Defines the root path route ("/")
  # root "articles#index"
end
