class CreateCampaignFaqs < ActiveRecord::Migration
  def change
    create_table :campaign_faqs do |t|
      t.references  :campaign
      t.string      :question, :null => false
      t.string      :answer, :null => false
      t.integer     :sort_order, :default => 0
      t.timestamps
    end
  end
end
