# frozen_string_literal: true

class Web::Admin::OrdersController < ApplicationController
  def index
    @orders = Order.where(aasm_state: 'actual')
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @products = products
    @order = Order.new
  end

  def create
    user = User.first

    @order = user.orders.build(order_params)

    if @order.save
      redirect_to admin_order_path(@order)
    else
      @products = products
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

  def products
    Product.where("amount > 0 AND aasm_state = 'actual'")
  end
end
