# frozen_string_literal: true

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'invalid product name' do
    @product = build(:product, name: nil)
    assert_not @product.valid?, 'product is valid without name'
  end

  test 'invalid product price' do
    @product = build(:product, price_cents: nil)
    assert_not @product.valid?, 'product is valid without price'
  end

  test 'invalid product amount' do
    @product = build(:product, amount: nil)
    assert_not @product.valid?, 'product is valid without amount'
  end

  test 'invalid product description' do
    @product = build(:product, short_description: nil)
    assert_not @product.valid?, 'product is valid without description'
  end

  test 'product price must be positive' do
    @product = build(:product, price_cents: -5)
    assert_not @product.valid?
  end

  test 'product amount must be positive' do
    @product = build(:product, amount: -10)
    assert_not @product.valid?
  end
end
