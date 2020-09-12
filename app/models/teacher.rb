class Teacher < ApplicationRecord
    has_one :profile, as: :userable 
    accepts_nested_attributes_for :profile
    belongs_to :discipline
    has_many :feedback
    has_many :course_section
    has_many :student , through: :course_section
end
