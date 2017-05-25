class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:lockable
  validates :name, :lastname, presence: true
  EMAIL_REGEX = /\A([a-z0-9][\._\-]?)+@(\w)+(\.([a-z])+)+\z/i
  validates :email,format: {with:  EMAIL_REGEX, message:"Formato invalido"}
  PASSWORD_FORMAT = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x

	validates :password, 
	  presence: true, 
	  length: { in: Devise.password_length }, 
	  format: { with: PASSWORD_FORMAT }, 
	  confirmation: true, 
	  on: :create 

	validates :password, 
	  allow_nil: true, 
	  length: { in: Devise.password_length }, 
	  format: { with: PASSWORD_FORMAT }, 
	  confirmation: true, 
	  on: :update
end
