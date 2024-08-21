class ProductsController < ApplicationController
  def index
    @products = Product.where(visible: true)
  end

  def show
    @product = Product.find(params[:id])
    redirect_to products_path, alert: 'Product not available.' unless @product.visible?
  end
end
