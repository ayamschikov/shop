# frozen_string_literal: true

class Product < ApplicationRecord
  include ProductRepository
  include Concerns::SoftDeletable

  has_many :order_products
  has_many :orders, through: :order_products

  validates :name, presence: true

  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true

  validates :short_description, length: { maximum: 15 }, presence: true
  validates :full_description, length: { maximum: 500 }

  monetize :price_cents, numericality: { greater_than: 0 }, presence: true

  def full_name
    "#{name}, #{price}"
  end
end
