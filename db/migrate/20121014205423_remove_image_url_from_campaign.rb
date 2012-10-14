class RemoveImageUrlFromCampaign < ActiveRecord::Migration
  def up
    remove_column :campaigns, :image_url
  end

  def down
    add_column :campaigns, :image_url, :text
  end
end
