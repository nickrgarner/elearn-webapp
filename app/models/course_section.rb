class CourseSection < ApplicationRecord
  belongs_to :teacher
  belongs_to :course
  has_many :feedbacks
  has_many :students
  has_many :purchase_histories
end
