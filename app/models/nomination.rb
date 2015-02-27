class Nomination < ActiveRecord::Base
	after_create :email_purchaser

	def to_param
		uuid
	end
	belongs_to :user
	validates :name, :store, :url, :description, :presence => true

	private
		def email_purchaser
			NominationMailer.nomination_receipt(self).deliver
		end
end
