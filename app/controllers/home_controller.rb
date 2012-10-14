class HomeController < ApplicationController
  before_filter :client_domain

  def index
  end

  def client_domain
    host = request.headers['host']
    local_domains = Selfstarter::Application::LOCAL_DOMAINS

    @seller_domain = host unless local_domains.include? host
    @campaign = Campaign.find_by_domain!(@seller_domain) if @seller_domain
  end
end
