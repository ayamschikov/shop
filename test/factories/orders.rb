# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    user
    total_price

    transient do
      products_count { 5 }
    end

    after(:create) do |_order, evaluator|
      create_list(:order, evaluator.products_count)
    end
  end
end
