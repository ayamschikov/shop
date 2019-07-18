# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :string, aliases: %i[name surname short_description full_description] do |n|
    "user-#{n}"
  end
  sequence :integer, aliases: %i[price_cents amount] do |n|
    n
  end
end
