class ProductsController < ApplicationController
  before_action :find_product, only: %i[edit update show destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  # skip_after_action :verify_authorized, only: [:show]

  def index
    @products = policy_scope(Product)
  end

  def show
    product_category
    authorize @product
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product

    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
    authorize @product
  end

  def update
    @product.update(product_params)
    authorize @product
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy
    authorize @product
    redirect_to products_path
  end

  private

  def product_category
    @product_categories = ProductCategory.where(product_id: @product.id)
  end

  def find_product
    @product = Product.find_by_id(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :amount, :category, :photo)
  end
end
