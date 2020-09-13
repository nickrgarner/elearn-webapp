class Cart < ApplicationRecord
    belongs_to :student
    has_many :course_sections
end
