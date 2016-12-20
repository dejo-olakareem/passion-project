class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.references :account
      t.integer :amount

      t.timestamps
    end
  end
end
