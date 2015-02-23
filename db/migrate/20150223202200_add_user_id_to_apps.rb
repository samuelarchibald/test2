class AddUserIdToApps < ActiveRecord::Migration
  def change
    add_column :apps, :user_id, :integer
    add_index :apps, :user_id
  end
end
