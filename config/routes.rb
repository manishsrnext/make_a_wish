Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'products#index'

  resources :products
  resources :wishes do
    get :get_wish_products
  end

  post '/add_product', to: 'wishes#add_product'

end

