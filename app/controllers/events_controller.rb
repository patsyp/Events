class EventsController < ApplicationController
	before_action :user_authorized, only: [:index]
	def index
		@states = get_states
		@current_user = current_user
		@local_events = Event.where(state:@current_user.state)
		@other_events = Event.where.not(state:@current_user.state)
		@joins = @current_user.events_joined.ids
	end
	def create
		event = Event.create(event_params.merge(user: current_user))
		if event.valid?
			redirect_to '/events'
		else
			flash[:event_errors] = event.errors.full_messages
			redirect_to '/events'
		end
	end
	def show
		@event = Event.find(params[:id])
		@comments = @event.comments
		@attendees = @event.users_attending
	end
	def edit
		@event = Event.find(params[:id])
		@states = get_states
	end
	def update
		event = Event.find(params[:id])
		event.update(event_params)
		if event.valid?
			redirect_to '/events'
		else
			flash[:update_errors] = event.errors.full_messages
			redirect_to "/events/#{event.id}/edit"
		end
	end
	def destroy
		Event.find(params[:id]).destroy
		redirect_to '/events'
	end
	private
	def event_params
		params.require(:event).permit(:name, :date, :location, :state)
	end
end
