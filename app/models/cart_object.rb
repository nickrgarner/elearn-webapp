class CartObject < ApplicationRecord
  belongs_to :cart
  belongs_to :course_section
  has_one :course, through: :course_section
end
