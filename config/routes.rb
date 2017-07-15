Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  get 'products/info/:id' => 'products#info'
  post 'carts/add_to_cart'
  delete 'carts/rm/:id' => 'carts#rm', as: :remove_cart_item


  get 'carts/my'

  root 'home#index'

  scope :admin do
    get 'products/all' #Rota para exibir a pagina com a lista de produtos
    get 'products/details/:id' => 'products#details'
    get 'products/new'
    post 'products/create'
  end
end
