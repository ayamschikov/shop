# frozen_string_literal: true

class Web::Admin::ProductsController < Web::Admin::ApplicationController
  def index
    @products = Product.actual
  end

  def show
    @product = Product.actual.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.actual.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_product_path(@product)
    else
      render 'new'
    end
  end

  def update
    @product = Product.actual.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.actual.find(params[:id])
    @product.remove!

    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(%i[name price amount short_description full_description])
  end
end
