class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :tags, as: :tagable

  enum status: [:accepted, :notaccepted]
end
