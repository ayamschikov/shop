# frozen_string_literal: true

require 'test_helper'

class Web::Admin::ProductsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    sign_in user
  end

  setup do
    @product = create(:product)
    @attributes = attributes_for :product
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create product' do
    assert_difference('Product.count') do
      post :create, params: { product: @attributes }
    end

    assert_redirected_to [:admin, Product.last]
  end

  test 'should show product' do
    get :show, params: { id: @product }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @product }
    assert_response :success
  end

  test 'should update product' do
    updated_name = generate(:string)

    patch :update, params: { id: @product, product: { name: updated_name } }
    assert_redirected_to %i[admin product]

    @product.reload
    assert_equal updated_name, @product.name
  end

  test 'should destroy product' do
    assert_difference('Product.count', -1) do
      delete :destroy, params: { id: @product }
    end

    assert_redirected_to %i[admin products]
  end
end
