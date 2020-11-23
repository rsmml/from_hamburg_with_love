class ProductsController < ApplicationController
  before_action :find_product, only %i[edit update show destroy]
  def index
    @products = Product.all
  end

  def show;end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product.params)
    authorize @product
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :new
    end
  end

  def edit
    authorize @product
  end

  def update
    @product.update(product_params)
    authorize product
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy
    authorize @product
    redirect_to rooth_path
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :category, :amount, :category, :photo)
  end
end
