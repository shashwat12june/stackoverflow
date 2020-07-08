class Answer < ApplicationRecord
  include Commentable
  include Votable

  belongs_to :question
  belongs_to :user
  has_many :answer_question_tags, as: :tagable

  enum status: [:accepted, :notaccepted]

  validates :answer, presence: true
end
