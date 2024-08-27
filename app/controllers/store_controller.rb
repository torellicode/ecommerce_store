class StoreController < ApplicationController
  def index
    @categories = Category.where(parent_id: nil)
    @products = Product.all.where(visible: true)
  end
end
