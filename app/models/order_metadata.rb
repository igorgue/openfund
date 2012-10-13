class OrderMetadata < ActiveRecord::Base
  attr_accessible :field, :order_id, :value
  belongs_to :order
end
