require 'addressable/uri'

class ApplicationController < ActionController::Base
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

	def current_user
		@current_user ||= User.find_by_session_token(session[:session_token])
	end

	def logged_in?
		!!@current_user
	end
end
