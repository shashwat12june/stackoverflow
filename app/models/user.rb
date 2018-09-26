class User < ApplicationRecord
  has_many :questions
  has_many :answers
  has_many :comments

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  UniquenessValidator

  validates :first_name, presence: true
  validates :phone_number, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates_confirmation_of :password
  has_secure_password

  def full_name
    self.first_name + " " + self.last_name
  end
end
