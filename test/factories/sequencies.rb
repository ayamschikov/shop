

FactoryBot.define do
    sequence :name do |n|
        "Product #{n}"
    end
    sequence :integer, aliases: %i[price_cents amount] do |n|
        rand(1...100)
    end
    sequence :short_description do
        "delicious #{name}"
    end
    sequence :full_description do
        "#{amount} very tasty #{name} for the price of one piece #{price_cents} #{price_currency}"
    end
end