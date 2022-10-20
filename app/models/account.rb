class Account < ApplicationRecord
  belongs_to :user
  has_many :credited_transactions, class_name: 'Transaction', foreign_key: 'debit_account_id'
  has_many :debited_transactions, class_name: 'Transaction', foreign_key: 'credit_account_id'
end
