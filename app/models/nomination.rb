class Nomination < ActiveRecord::Base
	def to_param
		uuid
	end
end
