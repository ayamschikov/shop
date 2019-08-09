# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name
    surname
    email

    factory :user_with_orders do
      transient do
        orders_count { 3 }
      end

      after(:create) do |user, evaluator|
        create_list(:order, evaluator.orders_count, user: user)
      end
    end
  end
end
