class Admin::CategoriesController < ApplicationController
  before_action :authorize_admin
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
    @parent_categories = Category.where(parent_id: nil)
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: "#{@category.name} was updated"
    end
  end

  def destroy
    @category.destroy
  end

  private

  def authorize_admin
    authorize(:admin, :manage_categories?)
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
