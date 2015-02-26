class Nomination < ActiveRecord::Base
	def to_param
		uuid
	end
	belongs_to :user
	validates :name, :store, :url, :description, :presence => true
end
