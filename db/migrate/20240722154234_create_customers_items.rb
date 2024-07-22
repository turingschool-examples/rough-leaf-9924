class CreateCustomersItems < ActiveRecord::Migration[7.1]
  def change
    create_table :customers_items do |t|
      t.belongs_to :customer, null: false, foreign_key: true
      t.belongs_to :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
