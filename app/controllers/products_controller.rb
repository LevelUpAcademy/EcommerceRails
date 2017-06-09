class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    Product.create(params.require(:product).permit([:title, :briefing, :description, :price, :quantity]))
    redirect_to root_path
  end

  def all
    @products = Product.all
  end

  def details
    @product = Product.find(params[:id])
  end
end
