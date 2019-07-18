# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    sequence(:price_cents) { rand(1...100) }
    sequence(:amount) { rand(1...20) }
    sequence(:short_description) { "delicious #{name}" }
    sequence(:full_description) do
      "#{amount} very tasty #{name} for the price of one piece #{price_cents} #{price_currency}"
    end
  end
end
