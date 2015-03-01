class App < ActiveRecord::Base
	belongs_to :user


	#validations
	validates :user_id, :presence => true
	validates :name, :store, :url, :presence => true


	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://srts.info/wp-content/uploads/2014/09/gold-trophy.jpg"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
