class AccountController < ApplicationController
  before_filter :authenticate_user!

  def index
    @code = current_user.stripe_access_token
  end

  def stripe_connect
		post_data = { :code => params[:code], :grant_type => 'authorization_code' }

		successful_connection, flash[:notice] = current_user.connect_with_stripe(post_data)

		if successful_connection
			redirect_to new_campaign_path
		else
			redirect_to stripe_error
		end
  end

  def stripe_error
  	true
  end

end
