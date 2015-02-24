class App < ActiveRecord::Base
	belongs_to :user
	 has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" } #, :default_url => "http://www.grammarly.com/blog/wp-content/uploads/2015/01/Silhouette-question-mark.jpeg"
	 validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

end
