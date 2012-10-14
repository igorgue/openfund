class CampaignsController < ApplicationController

  # before_filter :find_campaign,       :only => [:update, :delete, :edit, :show]
  before_filter :authenticate_user!,  :only => [:update, :delete, :edit, :new, :create]



  def index
    @campaigns = current_user.campaigns
  end

  def show
  end

  def new
    @campaign = Campaign.new
  end

  def create
    params[:start_time] = Time.zone.parse("#{params[:campaign].delete(:date)} #{params[:campaign].delete(:time)}")
    @campaign = Campaign.create(params[:campaign])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
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
    @campaign.user_id == current_user.id
  end

end
