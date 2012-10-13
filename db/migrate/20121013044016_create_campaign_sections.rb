class CreateCampaignSections < ActiveRecord::Migration
  def change
    create_table :campaign_sections do |t|
      t.references  :campaign
      t.string      :title, :null => false
      t.text        :text, :null => false
      t.attachment  :image
      t.integer     :sort_order, :default => 0
      t.timestamps
    end
  end
end
