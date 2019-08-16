# frozen_string_literal: true

class AmountValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless record.errors[attribute].empty?

    record.errors.add(:amount, :invalid_amount_of_products) if value > record.product.amount
  end
end

class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :amount, numericality: { only_integer: true, greater_than: 0 }, presence: true, amount: true
  monetize :price_cents, numericality: { greater_than: 0 }, presence: true

  before_validation :set_price
  before_save :reduce_products_amount

  def total_price_per_product
    price * amount
  end

  private

  def set_price
    return if product.nil?

    self.price = product.price
  end

  def reduce_products_amount
    product.amount -= amount
    product.save!
  end
end
