class CreateCampaignLevels < ActiveRecord::Migration
  def change
    create_table :campaign_levels do |t|

      t.timestamps
    end
  end
end
