class Course < ApplicationRecord
  belongs_to :discipline
  has_many :course_sections
end
