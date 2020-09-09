class Teacher < ApplicationRecord
    # belongs_to :discipline
    has_many :feedback
    has_many :course_section
    # has_many :student , through: :course_section
end
