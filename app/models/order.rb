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

require 'stripe'

class Order < ActiveRecord::Base
  belongs_to :campaign_level
  attr_accessible :address_one, :address_two, :city, :state, :zip, :country, :name, :price, :phone, :card_id, :email, :transaction_id, :level_id
  validates_presence_of :name, :email, :price, :card_id, :campaign_level_id

  # Public: Charge the user from a :card_id and creates a :transaction_id and
  # saves the order
  #
  # Examples
  #
  #   order.charge!
  #   # => 'tok_0XeV9Tea4w1AkQ'
  #
  # Returns the stripe token
  def charge!
    # get the credit card details submitted by the form
    # create the charge on Stripe's servers - this will charge the user's card
    charge = Stripe::Charge.create({
        :amount => @campaign_level.price_to_cents, # amount in cents
        :currency => CURRENCY,
        :card => @card_id,
        :description => @campaign_level.title,
        :application_fee => @campaign_level.application_fee_cents # amount in cents
      },
      @campaign_level.campaign.user.stripe_token # user's access token from the Stripe Connect flow
    )

    charge['id']
  end
end
