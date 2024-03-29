class User < ActiveRecord::Base

  before_save {self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX } , uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: {maximum: 16}
  validates :question, presence: true
  validates :answer, presence: true

  has_many :keychains

end
