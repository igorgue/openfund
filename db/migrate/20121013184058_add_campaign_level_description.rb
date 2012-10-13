class AddCampaignLevelDescription < ActiveRecord::Migration
  def up
  	add_column :campaign_levels, :description, :text
  end

  def down
  	remove_column :campaign_levels, :description
  end
end
