class Course < ApplicationRecord
    belongs_to :discipline
    has_many :course_section
    validates :course_number, numericality: { only_integer: true }
    validates :name, presence: true
    validates :area, presence: true
    validates :price, numericality: true
  end
  