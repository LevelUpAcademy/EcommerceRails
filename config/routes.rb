Rails.application.routes.draw do
  resources :products

  get 'home/index'
  root 'home#index'

  scope :admin do
    get 'products/new'
    post 'products/create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
