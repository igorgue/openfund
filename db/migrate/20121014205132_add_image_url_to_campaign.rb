class AddImageUrlToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :image_url, :text
  end
end
