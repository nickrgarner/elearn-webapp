class Student < ApplicationRecord
    has_one :profile, as: :userable 
    accepts_nested_attributes_for :profile, update_only: true
    belongs_to :discipline
    has_one :credit_card, dependent: :destroy
    has_one :cart, dependent: :destroy
    has_many :purchase_histories
    has_many :course_sections, through: :purchase_histories
    has_many :feedbacks
    has_many :teachers , through: :course_sections
    has_many :courses , through: :course_sections 

    def delete_student
        update(is_deleted: true)
      end
end
