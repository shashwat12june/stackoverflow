class Answer < ApplicationRecord

  include Commentable
  belongs_to :question
  belongs_to :user
  has_many :votes, as: :voteable
  has_many :answer_question_tags, as: :tagable

  enum status: [:accepted, :notaccepted]

  validates :answer, presence: true
end
