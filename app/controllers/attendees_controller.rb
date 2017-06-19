class AttendeesController < ApplicationController
	def create
	Attendee.create(user: current_user, event:Event.find(params[:id]))
	redirect_to '/events'
	end
	def destroy
	Attendee.find_by(user:current_user, event:Event.find(params[:id])).destroy
	redirect_to '/events'
	end
end
