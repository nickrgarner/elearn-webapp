class CourseSection < ApplicationRecord
    belongs_to :teacher
    belongs_to :course
    has_many :feedbacks
    has_many :students, through: :purchase_histories
    has_many :purchase_histories
    has_many :cart_objects
    has_many :carts, through: :cart_objects
  end
  