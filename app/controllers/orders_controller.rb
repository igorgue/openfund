class OrdersController < ApplicationController
  
  
  def index
  
    orders = Order.all
    @orders = orders
    
    #orders.each do |o|
    #  total += o.price
    #end
    
    #puts total
    
    @campaign = Campaign.find(params[:campaign_id])
    
    
    
  end
  
end
