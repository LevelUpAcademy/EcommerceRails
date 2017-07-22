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
        current_user.carts.create
      end
      current_user.carts.last.cart_products.create(product_id: params[:product_id])
      redirect_to carts_my_path
    end
  end

  def rm
    id_item = params[:id]
    item = current_user.carts.last.cart_products.find(id_item)
    item.destroy
    redirect_to carts_my_path
  end

  def checkout
    @cart_products = current_user.carts.last.cart_products

    @total = 0
    @cart_products.each do |p|
      @total += p.product.price
    end

  end

  def pay
    valor = params[:valor]

    puts "FINALIZANDO COMPRA:"
    puts "Usuario #{current_user.email}"
    puts "Valor da compra #{valor}"

    # aqui seria processado o pagamento (gerado nota fiscal...)

    current_user.carts.last.destroy
    redirect_to carts_thanks_path
  end

  def thanks

  end
end


# Outras maneiras de adicionar produtos nos carrinhos
# Cart.create({user_id: current_user.id})
# current_user.carts.create
#
# CartProduct.create({product_id: 10, cart_id: 5})
# product = Product.find(5)
# product.cart_products.create({cart_id: 5})
#
# cart = Cart.find(10)
# cart.cart_products.create({product_id: 5})
