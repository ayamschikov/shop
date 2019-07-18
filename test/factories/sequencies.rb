# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :string, aliases: %i[name surname] do |n|
    "user-#{n}"
  end
  sequence :integer, aliases: %i[price_cents amount] do |n|
    rand(1...100)
  end
  sequence :short_description do
    "delicious product"
  end
  sequence :full_description do
    "very tasty product for the price of one piece"
  end
end
