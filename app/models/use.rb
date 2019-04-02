class User < ApplicationRecord
  before_save{self.email = email.downcase}
  validates :name, presence: true,
            length: {maximum: Settings.maximum_name_length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            length: {maximum: Settings.maximum_email_length},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true,
            length: {minimum: Settings.minimum_password_length}
end
