class UsersController < ApplicationController
	before_action :user_authorized, only: [:index]
	before_action :logged_in, only:[:new]
	def new
		@states = get_states
	end
	def create
		user = User.create(user_params)
		if user.valid?
			session[:user_id] = user.id
			redirect_to '/events'
		else 
			flash[:reg_errors] = user.errors.full_messages
			redirect_to '/'
		end
	end 
	def edit
		@user=User.find(params[:id])
		@states = get_states
	end
	def update
		user = User.find(params[:id])
		user.update(user_params)
		if user.valid?
			redirect_to '/events'
		else
			flash[:user_errors] = user.errors.full_messages
			redirect_to "/users/#{user.id}/edit"
		end
	end
	private
	def user_params
	params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
	end
end

