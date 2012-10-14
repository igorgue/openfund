require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module Selfstarter
  
  class Application < Rails::Application
    APPLICATION_FEE = 0.05
    CURRENCY = 'usd'
    LOCAL_DOMAINS = [
      'localhost:3000',
      '0.0.0.0:3000',
      '127.0.0.1:3000',
      'localhost:8080',
      '127.0.0.1:8080',
      'localhost',
      '0.0.0.0',
      '127.0.0.1',
      'openfund.co',
      'openfund.co:3000',
      'openfund.co:8080'
    ]

    # --- Standard Rails Config ---
    config.time_zone = 'Eastern Time (US & Canada)'
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_record.whitelist_attributes = true
    # Enable the asset pipeline
    config.assets.enabled = true
    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
    # --- Standard Rails Config ---
  end
end
