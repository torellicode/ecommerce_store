class ProductsController < ApplicationController
  def index
    @products = Product.where(visible: true)
    @categories = Category.where(parent_id: nil)
    @subcategories = Category.where.not(parent_id: nil)
  end

  def show
    @product = Product.find(params[:id])
    redirect_to products_path, alert: 'Product not available.' unless @product.visible?
  end
end
