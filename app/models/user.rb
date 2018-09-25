class User < ApplicationRecord
  has_many :questions

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  UniquenessValidator

  validates :first_name, presence: true
  validates :phone_number, length: { minimum: 10 }, uniqueness: true
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }
  validates_confirmation_of :password
  has_secure_password
end
