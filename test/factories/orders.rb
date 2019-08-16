# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    user

    factory :order_with_products do
      transient do
        product_amount { generate(:integer) }
        reduce_by { rand(1..product_amount) }
        order_products_amount { 5 }
      end

      after(:build) do |order, evaluator|
        products = create_list(:product, evaluator.order_products_amount)

        products.each do |product|
          order.order_products << build(:order_product, product: product, amount: rand(1..product.amount))
        end
      end
    end
  end
end
