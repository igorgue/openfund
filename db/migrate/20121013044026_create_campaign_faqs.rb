class CreateCampaignFaqs < ActiveRecord::Migration
  def change
    create_table :campaign_faqs do |t|

      t.timestamps
    end
  end
end
