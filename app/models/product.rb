# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true
  validates :price_cents, :amount, numericality: { only_integer: true, greater_than: 0 }, presence: true

  validates :short_description, length: { maximum: 15 }, presence: true
  validates :full_description, length: { maximum: 500 }

  monetize :price_cents

  after_validation :transfer_price_errors

  private
    def transfer_price_errors
      messages = errors[:price_cents]
      messages.each do |message|
        errors.add(:price, message)
        errors.delete(:price_cents)
      end
    end
end