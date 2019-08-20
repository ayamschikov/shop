# frozen_string_literal: true

module OrderHelper
  def products_in_stock
    Product.in_stock
  end
end
