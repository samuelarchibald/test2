class NominationsController < ApplicationController
	def index
		@nominations = Nomination.where("user_id = '#{current_user.id}'")
	end
	def show
		@nomination = Nomination.find_by_uuid(params[:id])
	end
end
