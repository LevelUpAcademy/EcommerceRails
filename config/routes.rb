Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  scope :admin do
    get 'products/all' #Rota para exibir a pagina com a lista de produtos
    get 'products/details/:id' => 'products#details'
    get 'products/new'
    post 'products/create'
  end
end
