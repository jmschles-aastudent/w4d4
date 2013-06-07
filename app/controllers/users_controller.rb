class UsersController < ApplicationController

	def create
		@user = User.new(params[:user])
		if @user.save
			msg = ActivationMailer.activation_email(@user)
			msg.deliver!
			redirect_to bands_url
		else
			flash[:errors] ||= []
			flash[:errors] << "Invalid email/password combination."
			redirect_to new_user_url
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to new_user_url
	end

	def new
	end

	def activate
		query = params.keys.first
		@user = activation_token_checker(query)
		if @user
			@user.activated = true
			@user.save!
			redirect_to bands_url
			return
		end
		flash[:errors] ||= []
		flash[:errors] << "Activation failed"
		render :back
	end

end
