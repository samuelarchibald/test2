class CreateNominations < ActiveRecord::Migration
  def change
    create_table :nominations do |t|
    	t.string :name
    	t.string :store
    	t.string :url
    	t.string :description
    	t.string :stripe_description
    	t.string :email
    	t.integer :amount
    	t.string :currency
    	t.string :customer_id
    	t.string :card
    	t.integer :product_id
      t.timestamps null: false
    end
  end
end
