# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  accepts_nested_attributes_for :order_products

  monetize :total_price_cents, presence: true

  before_save :set_order_total_price

  private

  def set_order_total_price
    order_products.each do |order_product|
      self.total_price += order_product.product.price * order_product.amount
    end
  end
end
