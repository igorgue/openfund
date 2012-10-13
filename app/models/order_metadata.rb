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

class OrderMetadata < ActiveRecord::Base
  attr_accessible :field, :order_id, :value
  belongs_to :order
end
