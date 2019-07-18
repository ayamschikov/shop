# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true
  validates :price_cents, :amount, numericality: { only_integer: true, greater_than: 0 }, presence: true
  validates :short_description, length: { maximum: 15 }, presence: true
  validates :full_description, length: { maximum: 500 }

  monetize :price_cents
end
