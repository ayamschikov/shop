# frozen_string_literal: true

require 'test_helper'

class OrderProductTest < ActiveSupport::TestCase
  test 'invalid product amount' do
    order_product = build(:order_product, amount: nil)
    assert_not order_product.valid?
  end

  test 'amount must be positive' do
    order_product = build(:order_product, amount: -7)
    assert_not order_product.valid?
  end

  test "order_product's amount must be less than product's amount" do
    product = create(:product)
    order_product = build(:order_product, product_id: product.id, amount: product.amount + 1)

    assert_not order_product.valid?
  end

  test "must reduce product's amount" do
    product_amount = generate(:integer)
    reduce_by = rand(1..product_amount)

    product = create(:product, amount: product_amount)

    order = build(:order) do |order|
      order.order_products << build(:order_product, product: product, amount: reduce_by)
    end

    order.save!

    assert_equal product_amount - reduce_by, product.amount
  end

  test "must save product's price" do
    product = create(:product)
    order_product = create(:order_product, product_id: product.id, amount: product.amount)

    assert_equal product.price_cents, order_product.price_cents
  end
end
