class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :borrower_id
      t.integer :lender_id
      t.integer :amount,default: 0

      t.timestamps
    end
  end
end
