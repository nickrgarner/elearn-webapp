class Course < ApplicationRecord
    belongs_to :discipline
    has_many :course_sections
    validates :course_number, uniqueness: {scope: :discipline_id, message: "Course has already been created."},
              numericality: { only_integer: true }
    validates :name, presence: true
    validates :area, presence: true
    validates :price, numericality: true
  end
  