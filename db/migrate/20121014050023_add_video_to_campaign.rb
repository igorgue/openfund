class AddVideoToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :video, :string
  end
end
