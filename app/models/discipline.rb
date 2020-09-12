class Discipline < ApplicationRecord
  has_many :teachers
  has_many :courses
end
