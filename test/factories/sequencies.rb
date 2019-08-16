# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :price do |n|
    Money.new(n, 'USD')
  end
  sequence :string, aliases: %i[name surname short_description full_description password] do |n|
    "user-#{n}"
  end
  sequence :integer, aliases: %i[amount] do |n|
    n
  end
end
