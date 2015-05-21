class User < ActiveRecord::Base

	has_secure_password

	has_many :postings
	has_many :likes

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :first_name, :alias, 
							presence: true,
							length: { maximum: 50 }

	validates :email, 		presence: true, 
							uniqueness: { case_sensitive: false }, 
							format: { with: EMAIL_REGEX }

	validates :password, 	presence: true, 
							confirmation: true


end
