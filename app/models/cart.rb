class Cart < ApplicationRecord
    belongs_to :student
    has_many :cart_objects
    has_many :course_sections, through: :cart_objects

    def total
        course_sections.collect{ |x| x.course.price }.inject { |x, y| x + y  }
    end
end
