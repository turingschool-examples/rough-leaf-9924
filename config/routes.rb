Rails.application.routes.draw do
  resources :customer_items

  get "/customers/:id", to: "customers#show"

  get "/items", to: "items#index"
  
end
