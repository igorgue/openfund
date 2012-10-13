class AddCampaignSectionType < ActiveRecord::Migration
  def up
  	add_column :campaign_sections, :type, "ENUM('margin_on_bottom', 'no_margin_on_bottom')"
  end

  def down
  	remove_column :campaign_sections, :type
  end
end
