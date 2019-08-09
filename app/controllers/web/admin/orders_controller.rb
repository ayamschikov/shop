# frozen_string_literal: true

class Web::Admin::OrdersController < ApplicationController
  def index
    @orders = Order.where(isDeleted: false)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    user = User.first
    user.orders.create!(order_params)

    redirect_to admin_orders_path
  end

  def update
    @order = Order.find(params[:id])
  end

  def destroy
    order = Order.find(params[:id])
    order.isDeleted = true
    order.save

    redirect_to admin_orders_path
  end

  private

  def order_params
    params
      .require(:order)
      .permit(order_products_attributes: %i[product_id amount])
  end
end
