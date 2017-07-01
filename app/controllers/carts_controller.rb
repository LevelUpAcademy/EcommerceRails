class CartsController < ApplicationController

  def my
    if current_user == nil
      redirect_to new_user_session_path
    else
      @cart = current_user.carts.last
    end
  end

  def add_to_cart
    if current_user == nil
      redirect_to new_user_session_path
    else
      if current_user.carts == nil || current_user.carts.count == 0
        puts "CRIANDO CARRINHO"
        current_user.carts.create
      end
      puts "ADICIONANDO PRODUTO AO CARRINHO"
      puts params[:product_id]
      current_user.carts.last.cart_products.create(product_id: params[:product_id])
      puts "REDIRECIONANDO PARA HOME"
      redirect_to root_path
    end
  end
end
