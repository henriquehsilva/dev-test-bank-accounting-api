FactoryBot.define do
  factory :account do
    number {}
    amount { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
    association :customer, factory: :customer
  end
end
