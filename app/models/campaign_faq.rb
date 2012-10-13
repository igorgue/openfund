# == Schema Information
#
# Table name: campaign_faqs
#
#  id          :integer          not null, primary key
#  campaign_id :integer
#  question    :string(255)      not null
#  answer      :string(255)      not null
#  sort_order  :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CampaignFaq < ActiveRecord::Base
  # attr_accessible :title, :body
end
