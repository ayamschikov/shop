# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name
    price_cents
    amount
    short_description
    full_description
  end
end
