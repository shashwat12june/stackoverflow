class Tag < ApplicationRecord
  has_and_belongs_to_many :questions

  validates :tag_name, uniqueness: true
end
