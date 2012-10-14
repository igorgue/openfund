class AddCampaignIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :campaign_id, :integer
    add_index  :orders, :campaign_id
  end
end
