class CampaignsController < ApplicationController

  before_filter :find_campaign,       :only => [:update, :delete, :edit, :show]
  before_filter :authenticate_user!,  :only => [:update, :delete, :edit, :new, :create]

  def show
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new
    @campaign.name = params[:name]
    @campaign.goal = params[:goal]
    @campaign.domain = params[:domain]
    @campaign.start_time  = Time.zone.parse("#{params[:date]} #{params[:time]}")
    @campaign.user_id = current_user_id
    @campaign.save
  end

  def edit
  end

  def update
  end

  def delete
  end

  def show_by_domain
    @campaign = Campaign.find_by_domain!(params[:domain])
  end

private

  def find_campaign
    @campaign = Campaign.find(params[:id])
  end

  def verify_user
    @campaign.user_id == current_user_id
  end

end
