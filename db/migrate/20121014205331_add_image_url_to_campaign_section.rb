class AddImageUrlToCampaignSection < ActiveRecord::Migration
  def change
    add_column :campaign_sections, :image_url, :text
  end
end
