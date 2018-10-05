class Question < ApplicationRecord

  include Commentable
  include Votable

  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :answer_question_tags,as: :tagable
  has_and_belongs_to_many :tags, dependent: :destroy

  validates :question , presence: true, uniqueness: true
end
