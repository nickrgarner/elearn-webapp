class CartObject < ApplicationRecord
  belongs_to :cart
  belongs_to :course_section
end
