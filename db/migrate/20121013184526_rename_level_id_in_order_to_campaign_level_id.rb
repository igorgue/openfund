class RenameLevelIdInOrderToCampaignLevelId < ActiveRecord::Migration
  def up
    rename_column :orders, :level_id, :campaign_level_id
  end

  def down
    rename_column :orders, :campaign_level_id, :level_id
  end
end
