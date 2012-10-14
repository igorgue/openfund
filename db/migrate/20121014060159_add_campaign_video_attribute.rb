class AddCampaignVideoAttribute < ActiveRecord::Migration
  def up
  	add_column :campaigns, :video, :text
  end

  def down
  	add_column :campaigns, :video
  end
end
