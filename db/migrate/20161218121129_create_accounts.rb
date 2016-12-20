class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :balance,default: 0
      t.integer :debt_bal,default: 0
      t.integer :lend_bal,default: 0

      t.timestamps
    end
  end
end
