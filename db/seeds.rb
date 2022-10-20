# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

asterix = User.create!(
  name: 'Astérix'
)

obelix = User.create!(
  name: 'Obélix'
)

asterix_checking_account = Account.create!(
  name: 'Checking account',
  initial_amount: 0.00,
  user: asterix
)
asterix_saving_account = Account.create!(
  name: 'Saving account',
  initial_amount: 0.00,
  user: asterix
)
obelix_checking_account = Account.create!(
  name: 'Checking account',
  initial_amount: 5000.00,
  user: obelix
)

Transaction.create!(
  [
    {
      debit_account: obelix_checking_account,
      credit_account: asterix_checking_account,
      amount: 2500.00,
      transfer_date: DateTime.new(2022, 10, 10, 0, 0, 0)
    },
    {
      debit_account: asterix_checking_account,
      credit_account: asterix_saving_account,
      amount: 2100.00,
      transfer_date: DateTime.new(2022, 10, 12, 0, 0, 0)
    }
  ]
)
