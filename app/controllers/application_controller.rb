class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    
    sign_in_redirect_path
    
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def sign_in_redirect_path

    if current_user.campaigns.blank?
      new_campaign_path
    elsif current_user.campaigns.count == 1 
      campaign_orders_path(:campaign_id => current_user.campaigns.first.id)
    else
      account_path
    end

  end
end
