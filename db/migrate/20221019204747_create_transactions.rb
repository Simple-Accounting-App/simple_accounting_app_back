class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :debit_account_id
      t.integer :credit_account_id
      t.decimal :amount

      t.timestamps
    end
  end
end
