class CampaignsController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :update, :delete, :edit]

  def show
    # get the campaign
    @campaign = Campaign.find_by_domain! params[:domain]
  end

  def new
  end

  def edit
  end

  def update
  end

  def delete
  end

private

  def verify_user
  end

end
