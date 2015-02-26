class NominationsController < ApplicationController
	def index
		@nominations = Nomination.all
	end
	def show
		@nomination = Nomination.find_by_uuid(params[:id])
	end
end
