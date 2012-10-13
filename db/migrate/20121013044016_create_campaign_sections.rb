class CreateCampaignSections < ActiveRecord::Migration
  def change
    create_table :campaign_sections do |t|

      t.timestamps
    end
  end
end
