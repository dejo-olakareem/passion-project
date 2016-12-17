class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :name, null: false
      t.string :email, null: false, uniqueness: true
      t.integer :account_no
      t.integer :balance
      t.string :password_hash, null: false

      t.timestamps

    end

  end
end
