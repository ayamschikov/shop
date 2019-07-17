require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def setup
    @product = Product.new(name: 'apple', amount: 4, short_description: 'delicious apple')
    puts @product.price_cents
    puts @product.inspect
    #@product.price = Money.new(100, 'USD')
  end

  test "valid product" do
    assert @product.valid?, 'product is valid'
  end

  test "invalid product name" do
    @product.name = nil
    refute @product.valid?, 'product is valid without name'
    assert_not_nil @product.errors[:name], 'no validation error for name'
  end

  test "invalid product price" do
    #@product.price_cents = nil
    refute @product.valid?, 'product is valid without price'
    assert_not_nil @product.errors[:price], 'no validation error for price'
  end

  test "invalid product amount" do
    @product.amount = nil
    refute @product.valid?, 'product is valid without amount'
    assert_not_nil @product.errors[:amount], 'no validation error for name'
  end
  
  test "invalid product description" do
    @product.short_description = nil
    refute @product.valid?, 'product is valid without description'
    assert_not_nil @product.errors[:short_description], 'no validation error for description'
  end
end