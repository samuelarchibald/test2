class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :store
      t.string :url
      t.string :description
      #rails generate migration AddUserIdToApps
      t.timestamps null: false
    end
  end
end
