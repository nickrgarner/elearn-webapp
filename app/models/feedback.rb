class Feedback < ApplicationRecord
    validates :description, presence: true
    belongs_to :student
    belongs_to :teacher
    belongs_to :course_section
end
