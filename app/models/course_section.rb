class CourseSection < ApplicationRecord
    belongs_to :teacher
    belongs_to :course
    has_many :feedback
    has_many :student
    has_many :purchase_history
  end
  