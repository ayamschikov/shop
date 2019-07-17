require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  # def setup
  #   @product = FactoryBot.build(:product)
  #   # @product = Product.new(name: 'apple', price_cents: 10, amount: 4, short_description: 'delicious apple')
  #   # puts @product.price_cents
  #   # puts @product.inspect
  #   #@product.price = Money.new(100, 'USD')
  # end

  # test "valid product" do
  #   assert @product.valid?, 'product is valid'
  # end

  test "invalid product name" do
    @product = build(:product, name: nil)
    refute @product.valid?, 'product is valid without name'
    # assert_not_nil @product.errors[:name], 'no validation error for name'
  end

  test "invalid product price" do
    @product = build(:product, price_cents: nil)
    refute @product.valid?, 'product is valid without price'
    assert_not_nil @product.errors[:price], 'no validation error for price'
  end

  test "invalid product amount" do
    @product = build(:product, amount: nil)
    refute @product.valid?, 'product is valid without amount'
    assert_not_nil @product.errors[:amount], 'no validation error for name'
  end
  
  test "invalid product description" do
    @product = build(:product, short_description: nil)
    refute @product.valid?, 'product is valid without description'
    assert_not_nil @product.errors[:short_description], 'no validation error for description'
  end

  test "product price must be positive" do
    @product = build(:product, price_cents: -5)
    refute @product.valid?
  end

  test "product amount must be positive" do
    @product = build(:product, amount: -10)
    refute @product.valid?
  end

end