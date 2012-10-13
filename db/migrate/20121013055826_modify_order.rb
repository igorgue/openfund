class ModifyOrder < ActiveRecord::Migration
  def up
    change_table :orders do |t|
      # remove fields
      t.remove :token, :transaction_id, :status, :number, :uuid, :shipping, :tracking_number, :expiration

      # add the fields we need
      t.string :card_id, :null => true
      t.string :transaction_id, :null => true
    end
  end

  def down
    change_table :orders do |t|
      # add fields
      t.string  :token
      t.string  :transaction_id
      t.string  :status
      t.string  :number
      t.string  :uuid
      t.decimal :shipping
      t.string  :tracking_number
      t.date    :expiration

      # remove fields I added
      t.remove :card_id, :transaction_id
    end
  end
end
