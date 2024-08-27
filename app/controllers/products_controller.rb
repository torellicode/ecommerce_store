class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    redirect_to products_path, alert: 'Product not available.' unless @product.visible?
  end
end
