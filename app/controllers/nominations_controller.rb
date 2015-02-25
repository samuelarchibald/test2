class NominationsController < ApplicationController
	def show
		@nomination = Nomination.find(params[:id])
	end
end
