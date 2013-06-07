class SessionsController < ApplicationController

	def create
		@user = User.find_by_email(params[:user][:email])
		if @user.verify_password?(params[:user][:password])
			@user.generate_session_token
			session[:session_token] = @user.session_token

			redirect_to bands_url
		else
			flash[:errors] ||= []
			flash[:errors] << "Invalid username/password combination."
			redirect_to new_session_url
		end
	end

	def new
	end

	def destroy
		u = current_user
		if u.nil?
			redirect_to new_session_url
			return
		end
		
		session[:session_token] = nil
		u.session_token = nil
		u.save!
		
		redirect_to new_session_url
	end

end
