class User < ApplicationRecord
  has_many :questions
  has_many :answers
  has_many :comments

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  UniquenessValidator

  validates :first_name, presence: true

  VALID_PHONE_NUMBER_REGEX = /[0-9]*/
  validates :phone_number, uniqueness: true, presence: true, length: {is: 10},
            format: { with: VALID_PHONE_NUMBER_REGEX,  message: "Phone number should be of 10 digits"}
  validates :password, confirmation: true, length: { minimum: 6 }
  validates_confirmation_of :password
  has_secure_password

end
