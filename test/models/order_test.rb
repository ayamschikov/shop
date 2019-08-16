# frozen_string_literal: true

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'must calculate total_price' do
    order = create(:order_with_products)

    total_price_cents = order.order_products.reduce(0) do |sum, order_product|
      sum + order_product.amount * order_product.product.price_cents
    end

    assert_equal order.total_price_cents, total_price_cents
  end
end
