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

require 'test_helper'

class CampaignFaqTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
