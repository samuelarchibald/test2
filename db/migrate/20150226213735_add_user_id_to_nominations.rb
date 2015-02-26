class AddUserIdToNominations < ActiveRecord::Migration
  def change
    add_column :nominations, :user_id, :integer
    add_index :nominations, :user_id
  end
end
