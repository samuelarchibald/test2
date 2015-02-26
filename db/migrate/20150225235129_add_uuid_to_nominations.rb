class AddUuidToNominations < ActiveRecord::Migration
  def change
    add_column :nominations, :uuid, :string
  end
end
