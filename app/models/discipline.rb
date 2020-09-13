class Discipline < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :students
    has_many :teachers
    has_many :courses
  end
  