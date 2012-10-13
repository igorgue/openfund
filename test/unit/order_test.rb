# == Schema Information
#
# Table name: orders
#
#  address_one    :string(255)
#  address_two    :string(255)
#  city           :string(255)
#  state          :string(255)
#  zip            :string(255)
#  country        :string(255)
#  user_id        :string(255)
#  price          :decimal(, )
#  phone          :string(255)
#  name           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  card_id        :string(255)
#  transaction_id :string(255)
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
