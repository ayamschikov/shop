# frozen_string_literal: true
class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products

  validates :name, presence: true

  validates :amount, numericality: { only_integer: true, greater_than: 0 }, presence: true

  validates :short_description, length: { maximum: 15 }, presence: true
  validates :full_description, length: { maximum: 500 }

  monetize :price_cents, numericality: { greater_than: 0 }, presence: true

  def full_name 
    # TODO: добавить currency
    "#{name}, #{price}"
  end
end
