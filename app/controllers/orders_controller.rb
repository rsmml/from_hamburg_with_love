class OrdersController < ApplicationController
  # rescue_from ActiveRecord::RecordNotFound, with: :invalid_order
  before_action :find_order, only: %i[edit update show destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  # skip_after_action :verify_authorized, only: [:show]

  def index
    @orders = policy_scope(Order)
  end

  def show
    @order_details = current_order.order_details
    authorize @order_details
  end

  def new
    @order = Order.new
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    authorize @order

    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def edit
    authorize @order
  end

  def update
    @order.update(order_params)
    authorize @order
    redirect_to order_path(@order)
  end

  def destroy
    @order.destroy if @order.id == session[:order_id]
    session[:order_id] = nil
    authorize @order
    redirect_to root_path
  end

  private

  def find_order
    @order = Order.find_by_id(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id, :date, :total_ammount, :shipping_address, :status)
  end

  # def invalid_order
  #   logger.error "Sorry, Invalid order #{params[:id]}"
  #   redirect_to root_path, notice: "That order doesn't exist"
  # end
end
