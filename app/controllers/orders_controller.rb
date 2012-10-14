class OrdersController < ApplicationController
  
  
  def index
  
    @orders = Order.all
    @campaign = Campaign.find(params[:campaign_id])
    
  end
  
end
