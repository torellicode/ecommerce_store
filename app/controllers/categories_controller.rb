class CategoriesController < ApplicationController
  def index
    @categories = Category.where(parent_id: nil)
  end

  def show
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories
    @products = @category.products + @category.subcategories.flat_map(&:products)
  end
end
