class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes,as: :voteable, dependent: :destroy
  has_many :answer_question_tags,as: :tagable
  has_and_belongs_to_many :tags, dependent: :destroy

  validates :question , presence: true, uniqueness: true
end
