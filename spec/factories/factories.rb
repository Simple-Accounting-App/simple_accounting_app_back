FactoryBot.define do
  factory :user do
    name { 'John' }
  end

  factory :account do
    name { 'Checking account' }
    initial_amount { 0 }
    user
  end

  factory :transaction do
    debit_account factory: :account
    credit_account factory: :account, name: 'Saving account'
    amount { 0 }
    transfer_date { DateTime.new(2022, 10, 10, 0, 0, 0) }
  end
end
