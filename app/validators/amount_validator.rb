# frozen_string_literal: true

class AmountValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless record.errors[attribute].empty?

    record.errors.add(:amount, :invalid_amount_of_products) if value > record.product.amount
  end
end
