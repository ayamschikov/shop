FactoryBot.define do
  Money.locale_backend = :i18n
  factory :product do
    name {'apple'}
    price_cents { 10 }
    amount { 12 }
    short_description { 'delicious apple' }
    full_description { 'aaaaaa' }
  end
end
