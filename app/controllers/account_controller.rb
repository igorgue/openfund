class AccountController < ApplicationController
  before_filter :authenticate_user!
  require 'curb'
  require 'json'

  def index
    @code = current_user.stripe_access_token
  end

  def stripe_connect
		post_data = { :code => params[:code], :grant_type => 'authorization_code' }

		http = Curl.post("https://connect.stripe.com/oauth/token", post_data) do |http|
		  http.headers['Authorization'] = "Bearer #{STRIPE_SECRET_API_KEY}"
		end
		stripe_response = JSON.parse(http.body_str)

		if stripe_response.has_key? "error"
			@error = stripe_response[:error_description]
			render "account/stripe_error"
		end

		# the presence of this one key indicates success
		if stripe_response.has_key? "stripe_publishable_key"
			current_user.update_attributes({
				:stripe_livemode 				=> stripe_response[:livemode],
				:stripe_publishable_key	=> stripe_response[:stripe_publishable_key],
				:stripe_user_id 				=> stripe_response[:stripe_user_id],
				:stripe_refresh_token 	=> stripe_response[:refresh_token],
				:stripe_access_token 		=> stripe_response[:access_token]
			})
			@code = current_user.stripe_access_token
		else
			@code = 'oks'
		end
  end

end
