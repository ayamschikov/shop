# frozen_string_literal: true

class Web::Admin::OrdersController < ApplicationController
  def index
    @orders = Order.where(user: current_user, aasm_state: 'actual')
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params)

    if @order.save
      redirect_to admin_order_path(@order)
    else
      render 'new'
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.remove!

    redirect_to admin_orders_path
  end

  private

  def order_params
    params
      .require(:order)
      .permit(order_products_attributes: %i[product_id amount])
  end
end
