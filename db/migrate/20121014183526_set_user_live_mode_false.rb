class SetUserLiveModeFalse < ActiveRecord::Migration
  def up
  	change_column :users, :stripe_livemode, :boolean, :default => false
  end

  def down
  	raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
