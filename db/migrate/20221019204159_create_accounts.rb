class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.decimal :initial_amount
      t.integer :user_id

      t.timestamps
    end
  end
end
