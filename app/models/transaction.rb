class Transaction < ApplicationRecord
  belongs_to :debit_account, class_name: 'Account', foreign_key: 'debit_account_id'
  belongs_to :credit_account, class_name: 'Account', foreign_key: 'credit_account_id'

  validates :amount, format: { with: /\d*(\.\d+)?\z/, message: 'only allows decimal' }
  validates :amount, numericality: { greater_than: 0, message: 'must be above 0' }
  validates :transfer_date, presence: true

  validate :credit_and_debit_must_be_different

  private

  def credit_and_debit_must_be_different
    errors.add(:debit_account, 'must be different from credit account') if debit_account_id == credit_account_id
  end
end
