# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name
    surname
    email
    password
    password_confirmation
  end
end
