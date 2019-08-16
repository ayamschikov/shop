# frozen_string_literal: true

module OrderHelper
  def actual_products
    Product.where("amount > 0 AND aasm_state = 'actual'")
  end
end
