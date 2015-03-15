class App < ActiveRecord::Base
	belongs_to :user


	#validations
	validates :user_id, :presence => true
	validates :name, :store, :url, :presence => true


	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

	def slug
    	name.downcase.gsub(" ", "-")  
  	end

	def to_param
		"#{id}-#{slug}"
	end
end
