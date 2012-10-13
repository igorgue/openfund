# == Schema Information
#
# Table name: order_metadata
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  field      :string(255)
#  value      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class OrderMetadataTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
