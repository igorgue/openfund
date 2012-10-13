class CampaignsController < ApplicationController

  before_filter :find_campaign,       :only => [:update, :delete, :edit]
  before_filter :authenticate_user!,  :only => [:update, :delete, :edit, :new]

  def show
    # get the campaign
    @campaign = Campaign.find_by_domain!(params[:domain])
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new
  end

  def edit
  end

  def update
  end

  def delete
  end

private

  def find_campaign
    @campaign = Campaign.find(params[:id])
  end

  def verify_user
    @campaign.user_id == current_user_id
  end

end
