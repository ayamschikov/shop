class Web::Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    products = Product.all
    @order = Order.new
  end

  def edit 
  end

  def create
    product_ids = params.require(:order)[:product_ids].reject!(&:blank?)
    products = Product.find(product_ids)
    total_price_cents = products.reduce(0) { |sum, product| sum + product.price_cents }

    # TODO: Replace with Find user
    user = User.first 
    order = user.orders.create(total_price_cents: total_price_cents)

    # TODO: add amount. price_each = amount * product.price
    products.each do |product| 
      order.order_products.create(
        product_id: product.id,
        price_each: product.price,
        amount: 2,
      )
    end

    redirect_to admin_orders_path
  end

  def update
  end

  def destroy
    # TODO: set isDeleted to true
    order = Order.find(params[:id]) 
    order.destroy!

    redirect_to admin_orders_path
  end
end
