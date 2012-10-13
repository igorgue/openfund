class RemoveUserAddEmail < ActiveRecord::Migration
  def up
    change_table :orders do |t|
      t.remove :user_id
      t.string :email, :null => true
    end
  end

  def down
    change_table :orders do |t|
      t.remove :email
      t.string :user_id
    end
  end
end
