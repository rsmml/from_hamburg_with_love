class OrderDetailsController < ApplicationController
  include CurrentOrder
  before_action :find_order_detail, only: %i[edit update show destroy]
  before_action :set_order, only: :create


  def index
    @order_details = policy_scope(OrderDetail)
  end

  def new
    @order_detail = OrderDetail.new
    raise
    authorize @order_detail
  end

  def create
    @order = current_order
    @order_detail = @order.order_details.new(order_detail_params)
    authorize @order_detail

    @order.save
    session[:order_id] = @order.id
  end

  def edit
    authorize @order_detail
  end

  def update
    @order_detail.update(order_detail_params)
    authorize @order_detail
    # TODO redirect to ??
  end

  def destroy
    @order = Order.find(session[:order_id])
    @order_detail.destroy
    authorize @order_detail

    redirect_to root_path
  end

  private

  def find_order_detail
    @order_detail = OrderDetail.find_by_id(params[:id])
  end

  def order_detail_params
    params.require(:order_detail).permit(:product_id, :order_id, :amount, :price)
  end
end
