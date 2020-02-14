FactoryBot.define do
  factory :account do
    account_number {}
    amount { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
  end
end
