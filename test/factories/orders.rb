FactoryBot.define do
  factory :order do
    user
    total_price

    transient do
      products_count { 5 }
    end

    after(:create) do |order, evaluator|
      create_list(:order, evaluator.products_count)
    end
  end
end
