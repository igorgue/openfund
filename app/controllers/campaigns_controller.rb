class CampaignsController < ApplicationController

  before_filter :find_campaign,       :only => [:update, :delete, :edit, :show]
  before_filter :authenticate_user!,  :only => [:update, :delete, :edit, :new, :create]



  def index
    @campaigns = current_user.campaigns
  end

  def show

    @campaign = Campaign.find(params[:id])
    @campaign.date = @campaign_.start_time.to_date
    
  end

  def new
    @campaign = Campaign.new
    @stripe_client_id = STRIPE_CLIENT_ID
    render :edit
  end

  def create
    params[:start_time] = Time.zone.parse("#{params[:campaign].delete(:date)} #{params[:campaign].delete(:time)}")
    @campaign = Campaign.new(params[:campaign]).user = current_user
    @campaign.save
    redirect_to edit_campaign_path(@campaign)
  rescue
    render :new
  end

  def edit
    @campaign.blurb             ||= "This is the area for your sexy ass description."
    @campaign.tagline           ||= "Clever tagline."
    @campaign.secondary_tagline ||= "Another clever tagline, for good measure."
  end

  def update
    params[:start_time] = Time.zone.parse("#{params[:campaign].delete(:date)} #{params[:campaign].delete(:time)}")
    @campaign.update_attributes(params[:campaign])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def delete
  end

  def show_by_domain
    @campaign = Campaign.find_by_domain!(params[:domain])
  end

  def add_level
    @level = @campaign.levels.build(:title => params[:title], :description => params[:desciption], :cost => params[:cost].to_f).save
    respond_to do |format|
      format.js
    end
  end

  def add_faq
  end

  def add_section
  end

  def update_blurb
  end

private

  def find_campaign
    @campaign = Campaign.find(params[:id])
  end

  def verify_user
    @campaign.user_id == current_user.id
  end

end
