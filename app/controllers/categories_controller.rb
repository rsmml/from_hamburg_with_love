class CategoriesController < ApplicationController
  before_action :find_product, only: %i[edit update show destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  # skip_after_action :verify_authorized, only: [:show]

  def index
    @categories = policy_scope(Category)
  end

  def show
    authorize @category
  end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category

    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def edit
    authorize @category
  end

  def update
    @category.update(category_params)
    authorize category
    redirect_to category_path(@category)
  end

  def destroy
    @category.destroy
    authorize @category
    redirect_to root_path
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
