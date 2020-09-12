class Discipline < ApplicationRecord
  validates :name, presence: true
  has_many :student
  has_many :teacher
  has_many :course
end
