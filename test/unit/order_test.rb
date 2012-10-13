# == Schema Information
#
# Table name: orders
#
#  address_one       :string(255)
#  address_two       :string(255)
#  city              :string(255)
#  state             :string(255)
#  zip               :string(255)
#  country           :string(255)
#  price             :integer
#  phone             :string(255)
#  name              :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  card_id           :string(255)
#  transaction_id    :string(255)
#  email             :string(255)
#  campaign_level_id :integer
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
