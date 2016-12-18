class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, uniqueness: true
      t.string :password_hash, null: false
      t.integer :balance,default:0
      t.timestamps
    end
  end
end
