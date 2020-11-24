class ProductCategoriesController < ApplicationController
  before_action :find_product_category, only: %i[edit update show destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  # skip_after_action :verify_authorized, only: [:show]

  def index
    @product_categories = policy_scope(ProductCategory)
  end

  def show
    authorize @product_category
  end

  def new
    @product_category = ProductCategory.new
    @products = Product.all
    @categories = Category.all
    authorize @product_category
  end

  def create
    @product_category = ProductCategory.new(product_category_params)
    authorize @product_category

    if @product_category.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    authorize @product_category
  end

  def update
    @product_category.update(product_category_params)
    authorize product_category
    redirect_to product_category_path(@product_category)
  end

  def destroy
    @product_category.destroy
    authorize @product_category
    redirect_to products_path
  end

  private

  def find_product_category
    @product_category = ProductCategory.find(params[:id])
  end

  # def product_category
  #   @product_categories = ProductCategory.where(product_id: @product.id)
  # end

  def find_product
    @product = Product.find(params[:id])
  end

  def product_category_params
    params.require(:product_category).permit(:product_id, :category_id)
  end
end
