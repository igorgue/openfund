class CreateCampaignLevels < ActiveRecord::Migration
  def change
    create_table :campaign_levels do |t|
      t.references  :campaign
      t.string      :title, :null => false
      t.decimal     :cost, :precision => 8, :scale => 2, :null => false
      t.timestamps
    end
  end
end
