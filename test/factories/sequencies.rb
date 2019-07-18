# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :string, aliases: %i[name surname] do |n|
    "user-#{n}"
  end
end
