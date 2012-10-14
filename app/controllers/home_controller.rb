class HomeController < ApplicationController
  before_filter :client_domain

  def index
    if @campaign
      render 'campaigns/show_by_domain'
    end

    if current_user
      redirect_to sign_in_redirect_path
    end

    @random_campaign = Campaign.randy
  end

  def client_domain
    host = request.headers['host']
    local_domains = Selfstarter::Application::LOCAL_DOMAINS

    @seller_domain = host unless local_domains.include? host
    @campaign = Campaign.find_by_domain!(@seller_domain) if @seller_domain
  end
end
