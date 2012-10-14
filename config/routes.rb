Selfstarter::Application.routes.draw do
  get "orders/index"

  get "order/show"

  get "home/index"

  devise_for :users

  root :to => 'home#index'
  resources :campaigns do 
    resources :orders
  end
  # match '/d/:domain' => 'campaigns#show_by_domain', :constraints  => {:domain => /[0-z\.]+/}
  #root :to => 'preorder#index'
  #match '/preorder'               => 'preorder#index'
  #get 'preorder/checkout'
  #match '/preorder/share/:uuid'   => 'preorder#share', :via => :get
  #match '/preorder/ipn'           => 'preorder#ipn', :via => :post
  #match '/preorder/prefill'       => 'preorder#prefill'
  #match '/preorder/postfill'      => 'preorder#postfill'

  match 'campaigns/add-faq'       => 'campaigns#add_faq', :via => :post

  match 'account'                 => 'account#index'
  match 'account/stripe-connect'  => 'account#stripe_connect'
  match 'account/stripe-error'    => 'account#stripe_error'
  match 'checkout'                => 'home#checkout'
  match 'complete'                => 'account#complete'
  match 'confirmation'            => 'account#confirmation'

end
