class Session < ApplicationRecord
  belongs_to :user

  validates :authentication_token, uniqueness: true
end
