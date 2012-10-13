Selfstarter::Application.routes.draw do
  get "home/index"

  devise_for :users

  root :to => 'home#index'
  match '/:domain' => 'campaigns#show_by_domain', :constraints  => {:domain => /[0-z\.]+/}
  #root :to => 'preorder#index'
  #match '/preorder'               => 'preorder#index'
  #get 'preorder/checkout'
  #match '/preorder/share/:uuid'   => 'preorder#share', :via => :get
  #match '/preorder/ipn'           => 'preorder#ipn', :via => :post
  #match '/preorder/prefill'       => 'preorder#prefill'
  #match '/preorder/postfill'      => 'preorder#postfill'

  match 'account'                 => 'account#index'
  match 'account/stripe-connect'  => 'account#stripe_connect'

  resources :campaigns
end
