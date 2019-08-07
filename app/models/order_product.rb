class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :amount, numericality: { only_integer: true, greater_than: 0 }, presence: true
  monetize :price_each_cents, numericality: { greater_than: 0 }, presence: true
end
