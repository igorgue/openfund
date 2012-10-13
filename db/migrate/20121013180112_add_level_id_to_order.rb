class AddLevelIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :level_id, :integer
  end
end
