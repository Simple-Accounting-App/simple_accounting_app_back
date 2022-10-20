# app/graphql/mutations/create_transaction.rb
module Mutations
  class CreateTransaction < BaseMutation
    # Necessary arguments
    argument :debit_account_id, ID, required: true
    argument :credit_account_id, ID, required: true
    argument :amount, Float, required: true
    argument :transfer_date, GraphQL::Types::ISO8601DateTime, required: true

    # Return fields: state (success & errors) as well as the updated object.
    field :success, Boolean, null: false
    field :errors, [String], null: false
    field :transaction, Types::TransactionType, null: true

    # Mutation logic and return value.
    def resolve(**args)
      record = Transaction.new(args)

      if record.save
        { success: true, transaction: record, errors: [] }
      else
        { success: false, transaction: nil, errors: record.errors.full_messages }
      end
    end
  end
end
