class Vendor::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_vendor_or_admin
  before_action :set_product, only: %i[show edit update destroy toggle_visibility]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to vendor_products_path, notice: 'Product was created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to vendor_products_path, notice: 'Product was updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to vendor_products_path, notice: 'Product was deleted successfully'
  end

  def toggle_visibility
    @product.update(visible: !@product.visible)
    redirect_to vendor_products_path, notice: 'Product visibility was updated'
  end
  

  private

  def authorize_vendor_or_admin
    authorize(:vendor, :access?)
  end

  def set_product
    @product = current_user.products.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :inventory_count, :visible)
  end
end
