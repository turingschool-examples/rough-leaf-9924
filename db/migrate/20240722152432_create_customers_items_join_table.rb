class CreateCustomersItemsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :customers, :items do |t|
      t.index :customer_id
      t.index :item_id
    end
  end
end
