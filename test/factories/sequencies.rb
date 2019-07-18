# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :string, aliases: %i[name surname] do |n|
    "user-#{n}"
  end
  sequence :name do |n|
    "Product #{n}"
  end
  sequence :integer, aliases: %i[price_cents amount] do
    rand(1...100)
  end
  sequence :short_description do
    "delicious #{name}"
  end
  sequence :full_description do
    "#{amount} very tasty #{name} for the price of one piece #{price_cents} #{price_currency}"
  end
end
