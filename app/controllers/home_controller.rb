class HomeController < ApplicationController
  before_filter :client_domain

  def index
  end

  def client_domain
    host = request.headers['host']
    local_domains = Selfstarter::Application::LOCAL_DOMAINS

    @seller_domain = host unless local_domains.include? host
  end
end
