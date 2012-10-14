class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    
    if current_user.campaigns.count > 0 
      campaign_orders_path(:campaign_id => current_user.campaigns.first.id)
    else
		  new_campaign_path
		end
		
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
