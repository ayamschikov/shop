# frozen_string_literal: true

require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = create(:product)
    @attributes = attributes_for :product
  end

  test 'should get index' do
    get admin_products_url
    assert_response :success
  end

  test 'should get new' do
    get new_admin_product_url
    assert_response :success
  end

  test 'should create product' do
    assert_difference('Product.count') do
      post admin_products_url, params: { product: @attributes }
    end

    assert_redirected_to [:admin, Product.last]
  end

  test 'should show product' do
    get admin_product_url(@product)
    assert_response :success
  end

  test 'should get edit' do
    get edit_admin_product_url(@product)
    assert_response :success
  end

  test 'should update product' do
    patch admin_product_url(@product), params: { product: { name: 'updated' } }
    assert_redirected_to [:admin, :product]

    @product.reload
    assert_equal "updated", @product.name
  end

  test 'should destroy product' do
    assert_difference('Product.count', -1) do
      delete admin_product_url(@product)
    end

    assert_redirected_to [:admin, :products]
  end
end
