# frozen_string_literal: true

module Types
  class TransactionType < Types::BaseObject
    field :id, ID, null: false
    field :debit_account_id, Integer
    field :debit_account, Types::AccountType, null: false
    field :credit_account_id, Integer
    field :credit_account, Types::AccountType, null: false
    field :amount, Float
    field :transfer_date, GraphQL::Types::ISO8601DateTime, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
