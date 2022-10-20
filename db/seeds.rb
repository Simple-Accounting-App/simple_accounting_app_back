# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

asterix = User.create!(
    name: "Astérix"
)

obelix = User.create!(
    name: "Obélix"
)
  
asterix_checking_account = Account.create!(
    name: "Checking account",
    current_amount: 0.00,
    user: asterix
)
asterix_saving_account = Account.create!(
    name: "Saving account",
    current_amount: 0.00,
    user: asterix
)
obelix_checking_account = Account.create!(
    name: "Checking account",
    current_amount: 5000.00,
    user: obelix
)

Transaction.create!(
    [
        {
            debit_account: obelix_checking_account,
            credit_account: asterix_checking_account, 
            amount: 2500.00,
        },
        {
            debit_account: asterix_checking_account,
            credit_account: asterix_saving_account, 
            amount: 2100.00,
        }
    ]
)