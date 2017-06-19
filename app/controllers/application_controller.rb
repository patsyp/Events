class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
  	User.find(session[:user_id]) if session[:user_id]
  end
  def get_states
  states=["AL","AK","AS","AZ","AR","CA","CO","CT","DE","DC","FM","FL","GA","GU","HI","ID","IL","IN","IA","KS","KY","LA","ME","MH","MD","MA","MI","MN","MS","MO","MT","NE",
    "NV","NH","NJ","NM","NY","NC","ND","MP","OH","OK","OR","PW","PA","PR","RI","SC","SD","TN","TX","UT","VT","VI","VA","WA","WV","WI","WY"]
  end
  def user_authorized
  	redirect_to '/' unless session[:user_id]
  end
  def logged_in
  	redirect_to '/events' if session[:user_id]
  end
  helper_method :user_authorized
  helper_method :current_user
  helper_method :get_states
 
  helper_method :logged_in
end
