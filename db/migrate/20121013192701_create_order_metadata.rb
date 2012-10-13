class CreateOrderMetadata < ActiveRecord::Migration
  def change
    create_table :order_metadata do |t|
      t.integer :order_id
      t.string :field
      t.text :value

      t.timestamps
    end
  end
end
