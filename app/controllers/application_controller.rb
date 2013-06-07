require 'addressable/uri'

class ApplicationController < ActionController::Base

	before_filter :require_login

	protect_from_forgery

  def activation_token_checker(query)
		@users = User.all
		@users.each do |user|
			if user.activation_valid?(query)
				return user
			end
		end
		nil
	end

	def require_login
		unless logged_in?
			flash[:errors] ||= []
			flash[:errors] << "You must be logged in"
			redirect_to new_session_url
		end
		true
	end

	def current_user
		return nil unless session[:session_token]
		@current_user ||= User.find_by_session_token(session[:session_token])
	end

	def logged_in?
		!!current_user
	end
end
