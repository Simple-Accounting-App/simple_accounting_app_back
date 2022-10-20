module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :current_user_transactions, [Types::TransactionType], null: false

    def current_user_transactions
      Transaction.where(
        debit_account: { user_id: User::DEFAULT_USER_ID }
      ).or(
        Transaction.where(
          credit_account: { user_id: User::DEFAULT_USER_ID }
        )
      ).joins(:debit_account, :credit_account)
    end

    end
  end
end
