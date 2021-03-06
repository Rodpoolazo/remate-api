class User < ApplicationRecord
  has_secure_password

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:rut]

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: {case_sensitive: false}
  
end
