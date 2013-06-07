class ActivationMailer < ActionMailer::Base
  default from: "activation@musicapp.com"

  def activation_email(user)
  	@user = user
  	@url = "#{activate_users_url}?#{@user.activation_token}"
  	mail( to: @user.email, subject: 'Welcome!' )
  end
end
