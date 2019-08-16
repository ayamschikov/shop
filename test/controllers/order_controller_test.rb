# frozen_string_literal: true

require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = create(:order_with_products)
  end

  test 'should get index' do
    get admin_orders_url
    assert_response :success
  end

  test 'should get new' do
    get new_admin_order_url
    assert_response :success
  end

  test 'should create order' do
    order_products_attributes = []
    products = create_list(:product, 3)

    products.each do |product|
      order_products_attributes << { product_id: product.id, amount: 1 }
    end

    params = { order: {
      order_products_attributes: order_products_attributes
    } }

    assert_difference -> { Order.count } => 1, -> { OrderProduct.count } => products.count do
      post admin_orders_url, params: params
    end

    assert_redirected_to [:admin, Order.last]
  end

  test 'should show order' do
    get admin_order_url(@order)
    assert_response :success
  end

  test 'should set state to deleted' do
    assert_difference('Order.count', 0) do
      delete admin_order_url(@order)
    end

    @order.reload
    assert @order.deleted?
  end
end
