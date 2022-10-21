class Account < ApplicationRecord
  belongs_to :user
  has_many :credited_transactions, class_name: 'Transaction', foreign_key: 'credit_account_id'
  has_many :debited_transactions, class_name: 'Transaction', foreign_key: 'debit_account_id'

  def current_amount
    credited_transactions_amount = credited_transactions.where('transfer_date <= ?', Time.now).sum(:amount)
    debited_transactions_amount = debited_transactions.where('transfer_date <= ?', Time.now).sum(:amount)

    initial_amount + credited_transactions_amount - debited_transactions_amount
  end
end
