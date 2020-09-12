class PurchaseHistory < ApplicationRecord
    belongs_to :course_section
    belongs_to :student
    has_a :teacher, through: :course_section
end
