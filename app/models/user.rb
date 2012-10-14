# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  stripe_livemode        :boolean
#  stripe_publishable_key :string(255)
#  stripe_user_id         :string(255)
#  stripe_refresh_token   :string(255)
#  stripe_access_token    :string(255)
#

require 'curb'
require 'json'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :stripe_livemode, :stripe_publishable_key, :stripe_user_id, 
  								:stripe_refresh_token, :stripe_access_token
  has_many :orders

  def connect_with_stripe(params)
    http = Curl.post("https://connect.stripe.com/oauth/token", params) do |http|
      http.headers['Authorization'] = "Bearer #{STRIPE_SECRET_API_KEY}"
    end
    stripe_response = JSON.parse(http.body_str)

    if stripe_response.has_key? "error"
      %w(false stripe_response["error_description"])
    end

    # the presence of this one key indicates success
    if stripe_response.has_key? "stripe_publishable_key"
      self.update_attributes({
        :stripe_livemode        => stripe_response["livemode"],
        :stripe_publishable_key => stripe_response["stripe_publishable_key"],
        :stripe_user_id         => stripe_response["stripe_user_id"],
        :stripe_refresh_token   => stripe_response["refresh_token"],
        :stripe_access_token    => stripe_response["access_token"]
      })
      %w(true "successfully connected with stripe account")
    else
      %w(false "unable to find publishable key")
    end
  end
end
