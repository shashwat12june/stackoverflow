class Answer < ApplicationRecord

  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :answer_question_tags, as: :tagable

  enum status: [:accepted, :notaccepted]

  validates :answer, presence: true
end
