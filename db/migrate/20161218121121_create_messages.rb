class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.integer :amount,default: 0
      t.references :user
    end
  end
end
