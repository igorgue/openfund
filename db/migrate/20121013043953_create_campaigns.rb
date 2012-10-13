class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string      :name, :null => false
      t.decimal     :goal, :precision => 8, :scale => 2, :null => false
      t.string      :domain
      t.string      :tagline
      t.string      :secondary_tagline
      t.text        :blurb
      t.timestamp   :start_time
      t.references  :user
      t.boolean     :show_link, :default => true
      t.timestamps
    end
  end
end
