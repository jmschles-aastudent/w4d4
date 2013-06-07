require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :password, :session_token

  before_validation :set_activated_default,
  									:set_user_type_default,
  									:set_activation_token

  before_save :check_user_type

  validates :email, :presence => true,
  									:uniqueness => true,
  									:email => true

  validates :password_digest, :presence => true

  
  def activation_valid?(query) 	
  	self.activation_token == query
  end

  def activated?
  	self.activated
  end

  def password=(password)
  	self.password_digest = BCrypt::Password.create(password)
  end

  def verify_password?(password)
  	BCrypt::Password.new(self.password_digest) == password
  end

  def generate_session_token
  	self.session_token = SecureRandom.base64(16)
  	self.save!
  	self.session_token
  end

  def set_activated_default
  	self.activated ||= false
  	true
  end

  def set_user_type_default
  	self.user_type ||= "peon"
  	true
  end

  def set_activation_token
  	self.activation_token ||= SecureRandom.urlsafe_base64(16)
  	true
  end

  def check_user_type
  	%w(peon admin).include? self.user_type
  end
end
