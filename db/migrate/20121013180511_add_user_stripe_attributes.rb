class AddUserStripeAttributes < ActiveRecord::Migration
  def up
  	add_column :users, :stripe_livemode, :boolean, :after => :remember_created_at
  	add_column :users, :stripe_publishable_key, :string, :after => :stripe_livemode
  	add_column :users, :stripe_user_id, :string, :after => :stripe_publishable_key
  	add_column :users, :stripe_refresh_token, :string, :after => :stripe_user_id
  	add_column :users, :stripe_access_token, :string, :after => :stripe_refresh_token
  end

  def down
  	remove_column :users, :stripe_livemode
  	remove_column :users, :stripe_publishable_key
  	remove_column :users, :stripe_user_id
  	remove_column :users, :stripe_refresh_token
  	remove_column :users, :stripe_access_token
  end
end
