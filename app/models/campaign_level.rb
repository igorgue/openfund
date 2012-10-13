# == Schema Information
#
# Table name: campaign_levels
#
#  id          :integer          not null, primary key
#  campaign_id :integer
#  title       :string(255)      not null
#  cost        :decimal(8, 2)    not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CampaignLevel < ActiveRecord::Base
  attr_accessible :campaign_id, :title, :cost
end
