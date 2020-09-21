class Teacher < ApplicationRecord
    has_one :profile, as: :userable 
    accepts_nested_attributes_for :profile, update_only: true
    belongs_to :discipline
    has_many :feedbacks
    has_many :course_sections
    has_many :students, through: :course_sections
    has_many :courses, through: :course_sections
    def delete_teacher
        update(is_deleted: true)
      end
end
