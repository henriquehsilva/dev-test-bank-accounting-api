FactoryBot.define do
  factory :transfer_history do
    source_account_id { rand.to_s[2..11] }
    destination_account_id { rand.to_s[2..11] }
    value { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
  end
end
