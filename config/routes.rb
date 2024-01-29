Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'products#index'

  resources :products
  resources :wishes do
    post :add_product, on: :member
  end

end
